namespace :web do
  namespace :data do
    data_path = File.expand_path 'web/data'

    task :prepare do
      require 'nii/all'
      require 'yaml'
    end

    task languages: :prepare do
      languages = {}

      Nii::DATA.known_locales.sort.each do |code|
        #next if code == 'mul' or code == 'und'
        next unless Nii::DATA.locale_known? code

        canonical       = Nii::DATA.resolve_alias(code)
        locale          = Nii::Locale.new(canonical)
        language        = locale[:language, false]
        data            = languages[language] ||= {
          'code'        => language,
          'names'       => {},
          'locales'     => {},
          'sources'     => [],
          'territories' => [],
          'numbers'     => {},
          'aliases'     => {},
          'scripts'     => { 'primary' => [], 'secondary' => [] } }
        source          = Nii::DATA.source(locale).fetch('gem')
        locales         = data['locales'][source] ||= []

        data['aliases'][code] = canonical.to_s if code != canonical
        locales << code

        data['territories'] += Array(Nii::DATA.locale_data(locale, :info, :territories)&.values).flatten
        data['territories'] << locale.territory if locale.territory
        data['territories'].uniq!

        data['names']['en'] ||= Nii::DATA.locale_data(:en, :names, :languages, language)&.values_at('default', 'short', 'variant')&.compact
        data['names']['en'] ||= Nii::DATA.locale_data(:en, :names, :languages, locale)&.values_at('default', 'short', 'variant')&.compact

        if local_names = Nii::DATA.locale_data(locale, :names, :languages, language) and local_names != { 'default' => language }
          data['names'][language] ||= []
          data['names'][language] += local_names.values
          data['names'][language].uniq!
        end

        if scripts = Nii::DATA.locale_data(locale, :info, :language_data, :scripts)
          if primary = scripts['primary']
            data['scripts']['primary'] += primary
            data['scripts']['primary'].uniq!
          end
          if secondary = scripts['secondary']
            data['scripts']['secondary'] += secondary - data['scripts']['primary']
            data['scripts']['secondary'].uniq!
          end
        end

        data['scripts']['primary'] << locale.script if locale.script and not data['scripts']['primary'].include? locale.script

        data['plurals'] ||= { 'cardinal' => [], 'ordinal' => [] }
        data['plurals'].each_key do |type|
          data['plurals'][type] += Nii::DATA.locale_data(locale, :info, :plurals, type).keys
          data['plurals'][type].uniq!
        end

        %i[default_numbering_system other_numbering_systems].each do |group|
          numbers = Nii::DATA.locale_data(locale, :info, :numbers, group)
          numbers = { 'default' => numbers } unless numbers.is_a? Hash
          numbers.each { |key, value| data['numbers'][key] ||= value unless data['numbers']['default'] == value }
        end

        data['genders']      ||= Nii::DATA.locale_data(locale, :info, :grammar, :genders, :nominal)
        data['cases']        ||= Nii::DATA.locale_data(locale, :info, :grammar, :cases,   :default)
        data['definiteness'] ||= Nii::DATA.locale_data(locale, :info, :grammar, :definiteness)
      end

      languages.each_value do |data|
        data['scripts'] &&= data['scripts']['primary'] + data['scripts']['secondary']
        data.delete_if { |k, v| v == nil or v == [] }
      end

      File.write File.join(data_path, 'languages.yml'), languages.values.sort_by { |l| l['code'] }.to_yaml
    end

    task regions: :prepare do
    end

    task scripts: :prepare do
    end

    task numbers: :prepare do
    end

    task calendars: :prepare do
    end

    task units: :prepare do
    end
  end

  task data: %i[docs:setup data:languages data:regions data:scripts data:numbers data:calendars data:units]
end
