# frozen_string_literal: true

module Nii::Slim
  # @api internal
  class Scope
    CONTEXT_VARS = %i[ to_nii_context nii_context nii context              ]
    CONFIG_VARS  = %i[ to_nii_config  nii_config  nii                      ]
    LOCALE_VARS  = %i[ to_nii_locale  nii_locale  nii locale lang language ]
    OPTIONS      = %i[ default ]

    def initialize(object, binding)
      @object, @binding = object, binding
    end

    def context = @context ||= get_context.scope(@object)

    def format(value = Nii::UNDEFINED, **options, &block)
      if value == Nii::UNDEFINED
        value = yield
        block = nil
        options[:escape_html] = false if options[:escape_html].nil?
      end
      context.format(value, **options, &block)
    end

    def translate(namespace, message, *arguments)
      options = {}

      arguments.map! do |argument|
        case argument
        when Binding
          argument.local_variables.map { [_1, argument.local_variable_get(_1)] }.to_h
        when Hash
          OPTIONS.each { options[_1] = argument[_1] if argument.include? _1 }
          argument.except(*OPTIONS)
        else
          argument
        end
      end

      options[:default]   = message unless options.include? :default
      options[:namespace] = namespace if namespace
      context.render(message, arguments, **options)
    end

    private

    def check_vars(owner, vars)
      return unless owner
      vars.each do |var|
        if owner.is_a? Binding and owner.local_variable_defined? var
          value = owner.local_variable_get(var)
        elsif owner.respond_to? var
          value = owner.public_send(var)
        end
        yield value if value
      end
    end

    def get_config(owner)
      check_vars(owner, CONFIG_VARS) do |value|
        value = Nii::Config.new(value) if value.is_a? Hash
        return value.to_nii_config if value.respond_to? :to_nii_config
      end
      Nii::Config.new
    end

    def get_locale(owner)
      check_vars(owner, LOCALE_VARS) do |value|
        value = value.name if value.is_a? Symbol
        value = Nii::Locale.parse(value, complain: false) if value.is_a? String
        return value.to_nii_locale if value.respond_to? :to_nii_locale
      end
      nil
    end

    def get_context
      return @object if @object.is_a? Nii::Context
      check_vars(@binding, CONTEXT_VARS) { return _1.to_nii_context if _1.respond_to? :to_nii_context }
      check_vars(@object,  CONTEXT_VARS) { return _1.to_nii_context if _1.respond_to? :to_nii_context }

      config = get_config(@object).merge get_config(@binding)
      locale = get_locale(@binding) || get_locale(@object)

      if slim_config = Nii::Config[::Slim]
        config = config.merge(slim_config)
      end

      if env = Nii::RackEnv[@object, config]
        context        = env.context
        context.locale = locale if locale
        return context
      end

      return Nii::Global if locale.nil? and config.empty? and defined? Nii::Global
      locale ||= config.locale || Thread.current[:locale] || Thread.current[:i18n_config]&.locale
      locale ||= ::I18n.default_locale if defined? ::I18n
      locale ||= ENV['LANG'] || ENV['LC_CTYPE'] || Nii::Locale.root

      Nii::Context.new(locale, config)
    end
  end
end
