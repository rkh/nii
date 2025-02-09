# frozen_string_literal: true

module Nii::CLDR
  class Timezones
    def initialize(xml_path, json_path)
      @repo  = Repository.new(json_path, false)
      @store = @repo.store(:core, '.', :timezones, aliases: {}, dst: [], timezones: {}, meta_zones: [])
      load_xml(xml_path)
      load_json
      finalize
    end

    def write(uncompressed_path, compressed_path)
      @store.write(uncompressed_path, false)
      @store.write(compressed_path,   true)
    end

    def load_xml(file)
      doc = Nokogiri::XML(File.open(file))
      doc.xpath("//type").each do |entry|
        if preferred = entry['preferred']
          @store[:aliases][entry['name']] = { '001' => preferred }
        else
          aliases = entry['alias'].split(' ')
          @store[:timezones][entry['name']] = {
            description: entry['description'],
            iana: aliases.first
          }
          aliases.each do |name|
            @store[:aliases][name] = { '001' => entry['name'] }
          end
        end
      end
    end

    def load_json
      meta  = @repo.supplemental(:metaZones)
  
      zones = flatten_zones meta.fetch('metazoneInfo').fetch('timezone')
      zones.each do |name, entries|
        code = @store[:aliases].fetch(name).fetch('001')
        data = @store[:timezones].fetch(code)
        entries.each do |entry|
          from, to, name = entry.fetch('usesMetazone').values_at('_from', '_to', '_mzone')
          data[:meta]    = name unless to
          if from or to
            history = data[:meta_history] ||= []
            history << { meta: name, from: from, to: to }.compact
          end
        end
      end

      meta.fetch('metazones').each do |entry|
        entry           = entry.fetch('mapZone')
        name            = entry.fetch('_other')
        data            = @store[:aliases][name] ||= {}
        territory       = entry.fetch('_territory')
        target          = entry.fetch('_type')
        code            = @store[:aliases].fetch(target)
        code            = code[territory] || code['001']
        data[territory] = code
        @store[:meta_zones] << name unless @store[:meta_zones].include? name
      end

       @store[:primary] = @repo.supplemental(:primaryZones)

       @repo.locales.each do |code, locale|
          next unless code =~ /^(?:en|und)(?:-(.{2,3}))?$/
          territory = $1 || '001'
          
          next unless bundle = locale.bundle(:dates, :timeZoneNames)
          bundle['metazone']&.each do |zone, names|
            next unless short = names['short']
            aliases = @store[:aliases][zone]
            target  = aliases[territory] || aliases['001']
            short.each do |key, tz_code|
              if key == 'daylight' and not @store[:dst].include? tz_code
                @store[:dst] << tz_code
              end
              data = @store[:aliases][tz_code] ||= {}
              if territory == '001' or territory == '150'
                data.merge! aliases
              else
                data['001'] ||= aliases['001'] if aliases.include? '001'
                data[territory] = target
              end
            end
          end
       end
    end

    def flatten_zones(data, prefix = nil)
      data.inject({}) do |normalized, (key, value)|
        key    = "#{prefix}/#{key}" if prefix
        result = Hash === value ? flatten_zones(value, key) : { key => value }
        normalized.merge! result
      end
    end

    def finalize
      @store[:meta_zones].sort!
      @store[:aliases].transform_values! do |value|
        unless value['001']
          uniq = value.values.uniq
          value['001'] = uniq.first if uniq.size == 1
        end
        value.delete_if { |key, code| key != '001' and code == value['001'] }
        value.keys == ['001'] ? value['001'] : value
      end
      @store[:aliases].merge! @store[:aliases].transform_keys { |k| k.tr('_', ' ') }
    end
  end
end
