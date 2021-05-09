# frozen_string_literal: true

module Nii
  # Lazy loads and caches prepared CLDR data.
  #
  # By default, {Nii::Config} will use the instance at {Nii::DATA}.
  # This can be overridden via the data option.
  #
  # @note Unless you're working on nii itself or you're writing a nii plugin,
  #   this class is most likely irrelevant for you.
  #
  # @api internal
  class Data
    BUCKETS          = %i[info calendars names units rbnf]
    INFO_CALENDARS   = %w[generic gregorian]
    CALENDAR_ALIASES = { 'gregory' => 'gregorian' }
    private_constant :BUCKETS, :INFO_CALENDARS

    # @api internal
    def self._load(data) = Nii::DATA

    # @api internal
    def _dump(level)
      return '' if self == Nii::DATA
      raise TypeError, "cannot dump #{self.inspect}"
    end

      # @return [Nii::LoadPath]
    attr_reader :load_path

    # @param paths [Array<String>]
    def initialize(*paths)
      @load_path         = LoadPath.new { |path| path_added(path) }
      @known_locales     = {}
      @territories       = {}
      @numbering_systems = {}
      @calendars         = {}
      @aliases           = { locale: {}, territory: {}, calendar: CALENDAR_ALIASES }
      @buckets           = BUCKETS.map { |b| [b, Concurrent::Map.new] }.to_h
      @lock              = Concurrent::ReadWriteLock.new
      @cache             = Concurrent::Map.new
      load_path.append(paths)
    end

    # @return [Hash{"path", "gem", "require" => String}]
    def source(locale, resolve_alias: true)
      return unless info = @known_locales[normalize(locale, resolve_alias: resolve_alias)]
      info['source']
    end

    # @return [true, false] whether or not the given locale is available in the data set
    def locale_available?(locale)
      return false unless source = source(locale)
      load_path.has_file? 'info.json', directory: source['path']
    end

    # @return [true, false] whether or not the given locale is known to be present in any data set (even if not available)
    def locale_known?(locale) = @known_locales.key?(normalize(locale))

    # @param include_aliases [true, false] whether or not to include locale aliases
    # @return [Array<String>] list of known locales
    def known_locales(include_aliases = true)
      @lock.with_read_lock do
        locales  = @known_locales.keys
        locales += @aliases[:locale].keys if include_aliases
        locales
      end
    end

    # @param include_aliases [true, false] whether or not to include locale aliases
    # @return [Array<String>] list of available locales
    def available_locales(include_aliases = true)
      @lock.with_read_lock do
        known_locales(include_aliases).select { |locale| locale_available? locale }
      end
    end

    # Retrieves locale specific data.
    # @api internal
    def locale_data(locale, bucket, *keys, resolve_alias: true, ignore_unknown: false)
      return if ignore_unknown and !locale_known?(locale)
      keys = keys.map { |k| Utils.string(k) }
      raise ArgumentError, 'wrong number of arguments (given 2, expected 3+)' if keys.empty?
      if bucket == :calendars
        return get(locale, :info, 'calendars', *keys) if INFO_CALENDARS.include? keys.first
        keys.unshift('calendars')
      end

      get_bucket(locale, bucket, resolve_alias: resolve_alias).dig(*keys)
    end

    # @return [true, false] whether or not the given territory is available in the data set
    def territory_known?(territory) = @territories.key?(normalize(:territory, territory))

    # @param include_aliases [true, false] whether or not to include territory aliases
    # @return [Array<String>] list of available territories
    def territories(include_aliases = true)
      @lock.with_read_lock do
        locales  = @territories.keys
        locales += @aliases[:territory].keys if include_aliases
        locales
      end
    end

    # Retrieves territory specific data.
    # @api internal
    def territory_data(territory, *keys, resolve_alias: true)
      @lock.with_read_lock do
        territories = normalize(:territory, territory, resolve_alias: resolve_alias).split(' ')

        if territories.size > 1
          data = territory_data('001').merge('parents' => ['001'], 'contains' => territories)
        else
          data = @territories.fetch(territories.first) { raise Errors::UnknownLocale, "unknown territory #{territories.first.inspect}" }
        end

        keys.any? ? data.dig(*keys.map { |k| Utils.string(k) }) : data
      end
    end

    # Resolves an alias to its proper version.
    # @return String
    def resolve_alias(type = :locale, code)
      resolved = normalize(type, code)
      resolved.include?(' ') ? code : resolved
    end

    # @return [Array<String>]
    def numbering_systems = @numbering_systems.keys

    # @return [true, false]
    def numbering_system_known?(key) = @numbering_systems.include?(normalize(:numbering_system, key))

    # @return [Nii::NumberingSystem::Algorithmic, Nii::NumberingSystem::Numeric, nil]
    def numbering_system(key) = @numbering_systems[normalize(:numbering_system, key)]

    # @return [true, false]
    def calendar_known?(key) = !!calendar(key, false)

    # @return [Nii::Calendar::Generic, nil]
    def calendar(key, raise_if_missing = true)
      key = normalize(:calendar, key)
      @calendars[normalize(:calendar, key)] ||= begin
        const   = key.split('-', 2).first.capitalize
        factory = Calendar.const_get(const, false) if Calendar.const_defined?(const, false)
        factory = nil unless factory&.supports_type? key
        raise ArgumentError, "unsupported calendar system: #{key.inspect}" if raise_if_missing and !factory
        factory&.new(data: self, type: key)
      end
    end

    # @api internal
    def cache(id, *args, **options)
      catch :no_cache do
        cache = @cache.fetch_or_store(id) { Concurrent::Map.new }
        cache.fetch_or_store([args, options]) do
          payload = locale_data(*args, **options) if args.any?
          yield payload
        end
      end
    end

    # @api internal
    # @return [Array<String>] list of loaded locales
    # @see Nii::Setup::Finalized#eager_load
    def eager_load(*locales, buckets: nil)
      filter  = locales.any? ? Nii::LocalePreference.new(locales) : Nii::Locale.new
      buckets = Array(buckets || BUCKETS)
      available_locales(false).select do |locale|
        next unless filter.superset_of? locale
        buckets.each { |bucket| get_bucket(locale, bucket, resolve_alias: false) }
        true
      end
    end

    # @api internal
    # @return [Hash, String]
    def timezone_data(*keys)
      @timezone_data ||= @load_path.json(:timezones)&.except('@path')
      keys.any? ? @timezone_data.dig(*keys.map { |k| Utils.string(k) }) : @timezone_data
    end

    # @private
    def inspect
      self == Nii::DATA ? 'Nii::DATA' : "#<#{self.class}:#{@load_path.to_a.inspect}>"
    end

    private

    # @see #locale_data
    def get_bucket(locale, bucket_name, resolve_alias: true)
      locale        = normalize(locale, resolve_alias: resolve_alias)
      buckets       = @buckets.fetch(bucket_name) { raise Errors::UnknownLocale, "unknown bucket #{bucket_name.inspect}" }
      dir, gem, lib = source(locale, resolve_alias: resolve_alias)&.values_at('path', 'gem', 'require')
      require lib if lib and not buckets.key? locale

      @lock.with_read_lock do
        buckets.fetch_or_store(locale) do
          raise Errors::UnknownLocale, "unknown locale: #{locale}" unless dir
          raise Errors::UnknownLocale, "locale #{locale} unavailable, please install and load #{gem} gem" unless locale_available? locale

          path   = nil
          result = dir.split('/').inject({}) do |data, segment|
            path = path ? File.join(path, segment) : segment
            json = load_path.json(bucket_name, directory: path)
            Utils.deep_merge(data, json)
          end

          Utils.deep_freeze(result)
        end
      end
    end

    # normalize a locale or territory code
    def normalize(type = :locale, key, resolve_alias: true)
      key &&= Utils.string(key)
      return key unless resolve_alias and @aliases.include? type
      @lock.with_read_lock { @aliases.fetch(type).fetch(key, key) }
    end

    # will be called whenever we have a new data locale added
    def add_locale(locale, info)
      @known_locales[locale] = info 
      Parser::Locale.cache(locale)
    end

    # callback for a new data path being added
    def path_added(path)
      @lock.with_write_lock do
        @buckets.each_value(&:clear)

        load_path.json(:locales, path: path) do |data|
          data.fetch('locales', {}).each do |locale, info|
            info.fetch('locales', {}).each { |l, i| add_locale(l, i) }
            add_locale(locale, info) if info['source']
            @aliases[:locale][locale] = info['default_locale'] if info['default_locale']
          end
          @aliases[:locale].merge! data.fetch('aliases', {})
        end

        load_path.json(:numbering_systems, path: path) do |data|
          data.each do |key, value|
            next if key.start_with? '@'
            type    = NumberingSystem.const_get(value.fetch('type').capitalize)
            options = value.except('type').transform_keys(&:to_sym)
            @numbering_systems[key] = type.new(key, self, **options)
          end
        end

        load_path.json(:territories, path: path) do |data|
          @territories.merge!         data.fetch('territories', {})
          @aliases[:territory].merge! data.fetch('aliases',     {})
        end
      end
    end
  end
end
