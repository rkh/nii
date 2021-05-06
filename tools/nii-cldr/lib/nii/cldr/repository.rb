# frozen_string_literal: true

module Nii::CLDR
  class Repository
    attr_reader :root, :locales, :locale_info, :stores

    DEFAULT_LOCALES = {
      'latn' => 'und', 'roman' => 'la', 'lanatham' => 'nod', 'mymrshan' => 'my', 'mymrtlng' => 'my'
    }

    ADDITIONAL_ALIASES = {
      language: { 'root' => 'und' }
    }

    def initialize(root_path, trigger_run = true)
      @root          = Pathname.new(root_path).expand_path
      possible_root  = root.join('cldr-json')
      @root          = possible_root if possible_root.directory?
      @json_cache    = {}
      @supplementals = {}
      @stores        = {}
      aliases        = aliases(:language) { |l| Nii::Locale.parse(l).code }
      @locale_info   = store(:root, '.', :locales, locales: {}, aliases: aliases)[:locales]
      @locales       = load_locales

      if trigger_run
        @progressbar = ProgressBar.create(total: (@locales.size + 1)*2)
        run :load
        run :generate
        @progressbar.finish
      end
    end

    def store(group, path, name, data = {})
      store = @stores[group]   ||= {}
      store = store[path.to_s] ||= {}
      store = store[name]      ||= Store.new(self, group, path, name)
      store.apply(data)
      store
    end

    def write(path, **gzip_paths)
      FileUtils.rm_rf(path)
      gzip_paths.each_value { |p| FileUtils.rm_rf(p) }
      progress = ProgressBar.create(total: size(stores))

      stores.each do |group, directories|
        if group == :root
          data_path, gzip_path = path, gzip_paths[:core]
        else
          data_path, gzip_path = File.join(path, group.to_s),  gzip_paths[group]
        end

        directories.each_value do |files|
          files.each_value do |store|
            store.clean
            store.write(data_path, false) { |f| progress.title = f.ljust(30) }
            store.write(gzip_path, true) if gzip_path
            progress.increment
          end
        end
      end

      progress.finish
    end

    def load
    end

    def generate
      supplemental(:calendarPreferenceData).each do |territory, preferences|
        territory(territory, calendar_preference: preferences)
      end

      ms_data = supplemental('measurementData')
      ms_data.fetch('measurementSystem').each { |t, ms| territory(t, measurement_system: ms, temperature: ms) }
      ms_data.fetch('measurementSystem-category-temperature').each { |t, ms| territory(t, temperature: ms) }
      ms_data.fetch('paperSize').each { |t, ms| territory(t, paper_size: ms) }

      supplemental(:weekData).each do |key, data|
        key = underscore(key)
        data.each do |territory, value|
          next if territory =~ /-alt-variant$/
          week_data = territory(territory)[:week] ||= {}
          week_data[key] = key == 'minDays' ? Integer(value) : underscore(value)
        end
      end

      supplemental(:timeData).each do |territory, data|
        territory(territory, time_data: {
          allowed: data.fetch('_allowed').split(' '),
          perferred: data.fetch('_preferred')
        })
      end

      currencies    = store(:core, '.', :currencies)
      currency_data = supplemental(:currencyData)

      currency_data['fractions'].each do |currency, data|
        currencies[currency] = data.transform_keys { |k| underscore(k.sub(/^_/, '')) }
      end

      currency_data['region'].each do |territory, currency_list|
        info = territory(territory)[:currencies] ||= { current: [], all: [] }
        currency_list.each do |currency_entries|
          currency_entries.each do |currency, data|
            from, to, tender = data.values_at('_from', '_to', '_tender')
            currency_info = currencies[currency] ||= {}
            currency_info[:territories]          ||= []
            currency_info[:former_territories]   ||= []

            if tender or to
              currency_info[:former_territories] << territory
            else
              currency_info[:territories] << territory
              info[:current] << currency unless tender or to
            end

            info[:all] << { currency: currency, from: from, to: to }.compact
          end
        end
      end

      supplemental(:unitPreferenceData).each do |quantity, data|
        data.each do |topic, territory_data|
          territory_data.each do |territory, units|
            info = territory(territory)
            info = info[:unit_preferences] ||= {}
            info = info[quantity]          ||= {}
            info[topic] = units.uniq
          end
        end
      end

      supplemental(:territoryContainment).each do |territory, data|
        territory   = territory.sub(/-status-.+$/, '')
        parent_data = territory(territory)
        contains    = parent_data[:contains] ||= []
        data['_contains'].each do |subterritory|
          contains << subterritory
          sub_data = territory(subterritory)
          sub_data[:parents] ||= []
          sub_data[:parents] << territory unless sub_data[:parents].include? territory

          parent_data.except(:contains, :parents, :unit_preferences).each do |key, value|
            sub_data[key] ||= value
          end

          unit_preferences   = sub_data[:unit_preferences]    ||= {}
          parent_preferences = parent_data[:unit_preferences] ||= {}
          parent_preferences.each do |key, value|
            unit_preferences[key] = value.merge(unit_preferences[key].to_h)
          end
        end
      end

      supplemental(:calendarData).each do |calendar, data|
        store(:calendars, '.', :calendar_systems, calendar => parse_data_hash(data))
      end

      units  = store(:core, '.', :unit_data, constants: {}, units: {}, base_units: {})
      consts = units[:constants]
      base   = units[:base_units]
      units  = units[:units]

      supplemental(:units, namespace: :unitConstants).each do |constant, data|
        consts[constant] = data.fetch('_value')
      end

      supplemental(:units, namespace: :unitQuantities).each do |unit, data|
        key  = data['_quantity']
        raise "base unit conflict for #{key}: #{base[key]} vs #{unit}" if base[key]
        base[key] = unit
        units[unit] ||= {}
        units[unit].merge! 'quantity' => key, 'base_unit' => unit
      end

      supplemental(:units, namespace: :convertUnits).each do |unit, data|
        data = data.transform_keys { |key| underscore(key.sub(/^_/, '')) }
        data['quantity'] ||= units.fetch(data.fetch('base_unit')).fetch('quantity')
        units[unit]      ||= {}
        units[unit].merge! data
      end

      json('cldr-core/scriptMetadata').fetch('scriptMetadata').each do |script, data|
        DEFAULT_LOCALES[script.downcase] = data.fetch('likelyLanguage') unless script == 'Latn'
        store(:core, '.', :scripts, script => parse_data_hash(data))
      end

      supplemental(:numberingSystems).each do |system, data|
        case type = data.fetch('_type')
        when 'numeric'
          data = { type: type, digits: data.fetch('_digits').chars }
        when 'algorithmic'
          case rules = data.fetch('_rules')
          when %r{^(\w+)/(\w+)/([\w\-]+)$} then rules = { locale: $1.tr('_', '-'), rule_set: $3, rbnf: underscore($2) }
          when %r{^[\w\-]+$}               then rules = { locale: 'und', rule_set: rules, rbnf: 'numbering_system_rules' }
          else raise ArgumentError, "unsupported rule value: #{rules}"
          end
          data = { type: type, rules: rules }
          data[:default_locale] = rules[:locale] if rules[:locale] != 'und'
        else raise "unknown nu type: #{type}"
        end
        data[:default_locale] ||= DEFAULT_LOCALES.fetch(system) { DEFAULT_LOCALES.fetch(system.sub(/low$/, ''), 'und') }
        store(:core, '.', :numbering_systems, system => data)
      end
    end

    def parse_data_hash(hash)
      return hash unless hash.is_a? Hash
      hash = hash.transform_keys do |key|
        case key
        when '_end'   then 'end'
        when '_start' then 'start'
        else underscore(key)
        end
      end
      hash.transform_values { |value| parse_data_hash(value) }
    end

    def territory(key, value = nil)
      result             = store(:core, '.', :territories)
      result[:aliases] ||= aliases(:territory)
      result             = result[:territories] ||= {}
      result             = result[key] ||= {}
      result.merge! value if value
      result
    end

    def json(path)
      JSON.parse(root.join("#{path}.json").read, object_class: Nii::CLDR::JSObject).to_h
    end

    def supplemental(key, namespace: key)
      @supplementals[[key, namespace]] ||= begin
        path = "cldr-core/supplemental/#{key}"
        data = json(path).fetch('supplemental')
        key  = namespace.to_s
        
        unless data.include? key
          possible = data.keys - ['version']
          key      = possible.first if possible.size == 1
        end

        result = data[key]
        raise("expected #{path}.json to include #{key}") unless result
        result
      end
    end

    def locale(code)
      @locales.fetch(code)
    end

    def inspect
      "#<#{self.class.inspect}:#{@root}>"
    end

    def aliases(key, &block)
      block ||= proc { |e| e }
      supplemental('aliases').fetch('alias').fetch("#{key}Alias").
        transform_values { |v| block.call(v.fetch('_replacement')) }.
        merge(ADDITIONAL_ALIASES.fetch(key, {}))
    end

    def underscore(key)
      case key
      when Array  then key.map { |v| underscore(v) }
      when String then key.split(/(?<=[a-z])(?=[A-Z])/).map(&:downcase).join('_')
      else key
      end
    end

    def size(payload)
      case payload
      when Array then payload.inject(0) { |sum, entry| sum + size(entry) }
      when Hash  then size(payload.values)
      else 1
      end
    end

    private

    def run(method)
      locales.each do |code, locale|
        @progressbar.title = "#{method} #{code}".ljust(30)
        @progressbar.increment
        locale.public_send(method)
      end
      @progressbar.increment
      public_send(method)
    end

    def load_locales
      modern, full    = json('cldr-core/availableLocales').fetch('availableLocales').values_at('modern', 'full')
      defaults        = json('cldr-core/defaultContent').fetch('defaultContent')
      additional      = supplemental('parentLocales').fetch('parentLocale').to_a.flatten
      additional     += json('cldr-localenames-full/main/root/languages').dig('main', 'root', 'localeDisplayNames', 'languages').keys.reject { |k| k =~ /-alt-/}
      full            = ['root', *full, *defaults, *additional].uniq
      modern_defaults = defaults.select { |locale| modern.include? locale[/^[^\-]+/] }
      modern          = ['root', *modern, *modern_defaults].uniq
      full.sort_by { |e| [e == 'root' ? 0 : 1, e.count('-'), e] }.map do |code|
        [code, Locale.new(self, code, relevant: modern.include?(code), default: defaults.include?(code))]
      end.compact.to_h
    end
  end
end
