# frozen_string_literal: true

module Nii
  # @api internal
  class RackEnv
    MAX_DEPTH = 3
    private_constant :MAX_DEPTH

    def self.prepare(config)
      instance = new(config)
      -> env { instance.dup.call(env) }
    end

    def self.[](env, config, depth = 0)
      return if depth >= MAX_DEPTH
      return new(config, env) if env.is_a? Hash and env['PATH_INFO']
      return self[env.request, config, depth + 1] if env.respond_to? :request
      self[env.env, config, depth + 1] if env.respond_to? :env
    end

    attr_reader :config, :env, :request, :env_key, :ignore_paths, :content_header, :timezone,
      :language_header, :timezone_header, :timezone_cookie, :locale_path, :domain, :context

    def initialize(config, env = nil)
      @config          = Nii::Config.new(config)
      @env             = nil

      @env_key         = @config.env_key      || 'nii.context'
      @ignore_paths    = Array(@config.ignore_paths).map { |path| path_pattern(path) }

      @content_header  = @config.content_header
      @content_header  = 'Content-Language' if content_header.nil? or content_header == true

      @language_header = header_key(@config.language_header)
      @language_header = 'HTTP_ACCEPT_LANGUAGE' if language_header.nil? or language_header == true

      @timezone_header = @config.timezone_header
      @timezone_header = ['HTTP_TIMEZONE', 'HTTP_TIME_ZONE', 'HTTP_TZ'] if timezone_header.nil? or timezone_header == true
      @timezone_header = timezone_header ? Array(timezone_header).map { |h| header_key(h) } : []

      @timezone_cookie = @config.timezone_cookie
      @timezone_cookie = ['tz', 'browser_time_zone'] if timezone_cookie.nil? or timezone_cookie == true
      @timezone_cookie = timezone_cookie ? Array(timezone_cookie) : []

      @locale_path     = path_pattern(@config.locale_path)
      @locale_path     = %r{\A/?(?<locale>[^/]+)(?<path>/.*)?\Z} if locale_path == true

      @domains         = @config.domains&.map do |domain, domain_config|
        domain_config  = Config.new(domain_config)
        locale         = domain_config.locale
        locale_path    = domain_config.locale_path
        [path_pattern(domain), locale, locale_path, domain_config.except(:locale, :locale_path)]
      end

      call(env) if env
    end

    def ignore?(path)
      ignore_paths.any? { |pattern| pattern === path }
    end

    def call(env)
      raise RuntimeError, "env already initialized" if @env
      @env     = env
      @request = Rack::Request.new(env)
      negotiate!
      self
    end

    def process
      tz_was                = Nii::UNDEFINED
      Time.zone, tz_was     = timezone, Time.zone if timezone and Time.respond_to? :zone
      status, headers, body = response = yield
          
      # We only want to add headers to response's with a body (or HEAD responses to a request that has a body for GET).
      return response unless status.between? 200, 499 and status != 204 and status != 304

      # Per Rack spec, headers don't actually need to be a Hash.
      headers = Rack::Utils::HeadersHash.new(headers) unless headers.is_a? Hash

      if content_header
        headers[content_header] ||= begin
          locales = context.available_locales || context.locale(true)
          locales.without_extensions.to_s
        end
      end
    ensure
      Time.zone = tz_was if tz_was != Nii::UNDEFINED
    end

    private

    def negotiate!
      # General lay of the land
      # Duplicates the env so modifications don't "leak" to outer middleware.
      # This way you can use multiple Nii::Middleware instance in your stack.
      @context    = Nii::Context.new(language_header ? env[language_header] : [], config)
      request     = Rack::Request.new(env)
      host        = request.host
      locale_path = @locale_path

      # Per domain configuration.
      # If the domain has configuration options beyond locale and locale_path, a subcontext will
      # be created.
      if domains
        domains.each do |pattern, locale, path, domain_config|
          next unless match = pattern.match(host)
          context           = context.subcontext(domain_config) unless domain_config.empty?
          locale_path       = path unless path.nil?
          context.locale    = locale if locale
        end
      end
  
      # Path matching. If enabled, this will default to /:locale/* format and attempt to set SCRIPT_NAME and PATH_INFO
      # accordingly.
      if locale_path
        return locale_redirect(env, context) unless match = locale_path.match(path) and locale = match[:locale]
        return locale_redirect(env, context) unless context.available_locales.nil? or context.available_locales.superset_of? locale
        context.available_locales = context.available_locales ? context.available_locales & locale : locale

        # config.remove_locale_path will default to nil, in which case we will only adjust SCRIPT_NAME/PATH_INFO if it makes sense.
        if config.remove_locale_path != false
          remainder = match.named_captures['path'] || match.post_match
          if path.end_with? remainder
            script_name        = path[0..-remainder.size-1]
            path               = remainder.start_with?('/') ? remainder : "/#{remainder}"
            script_name        = script_name[0..-2] if script_name.end_with? '/'
            env['PATH_INFO']   = path
            env['SCRIPT_NAME'] = script_name
          elsif config.remove_locale_path
            # The path capture wasn't at the end of the path, but the config tells us to set PATH_INFO anyway.
            env['PATH_INFO']   = remainder
          end
        end
      end

      # Determine the timezone if possible
      if config.timezone?
        @timezone = Timezone[config.timezone, config.territory, config, complain: true]
      else
        tz_names  = timezone_header.map { |header| env[header] }
        tz_names += timezone_cookie.map { |cookie| request.cookies[timezone_cookie] }
        tz_names.each do |name|
          next unless name and tz = Timezone[name, config.territory, config, complain: false]
          @timezone = context.timezone = tz
          break
        end
      end

      # Update env and trigger request
      env[env_key]          = context
      env[language_header]  = context.locale_preference.to_s if language_header
    end

    def path_pattern(pattern)
      return pattern unless pattern.is_a? String and type = config.pattern_style
      type.new(pattern)
    end

    def header_key(header)
      return header unless header
      return header if header.start_with? 'HTTP_'
      'HTTP_' + header.tr('-', '_').upcase
    end
  end
end
