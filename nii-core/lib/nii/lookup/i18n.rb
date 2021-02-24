# frozen_string_literal: true

module Nii::Lookup
  class I18n < FileSystem
    FORMATS = {
      "rb"   => Nii::Formats::Ruby.new(format: :i18n),
      "json" => Nii::Formats::JSON.new(format: :i18n),
      "yaml" => Nii::Formats::YAML.new(format: :i18n),
      "yml"  => Nii::Formats::YAML.new(format: :i18n)
    }
    Nii::Lookup[:i18n] = self

    separators = %w[. _ -]
    SEP_REGEXP = Regexp.union(separators)
    SEP_GLOB   = "*{#{separators.join(',')}}"
    private_constant :SEP_REGEXP, :SEP_GLOB

    private

    def default_formats = FORMATS

    def normalize_namespace(name, message)
      super(name, config.namespace)
    end

    def glob_pattern_for(locale, namespace)
      return unless config.namespace == namespace
      "**/#{SEP_GLOB}#{locale.glob_pattern}.{yml,yaml,json,rb}"
    end

    def scan_locales
      load_path.glob('**/*.{yml,yaml,json,rb}').map do |path|
        path.basename.to_s.split(SEP_REGEXP)[-2]
      end
    end
  end
end
