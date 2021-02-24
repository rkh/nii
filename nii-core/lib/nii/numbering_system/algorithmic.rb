# frozen_string_literal: true

module Nii::NumberingSystem
  class Algorithmic < Generic
    # @return [false]
    def decimal? = false

    private

    def format_value(value, rules = nil, **options)
      rbnf.format(value, @rule_set, **options)
    end

    def setup(rules:)
      @base_locale = Nii::Locale.parse(rules.fetch('locale'))
      @rule_set    = rules.fetch('rule_set')
      @rbnf_key    = rules.fetch('rbnf')
    end

    def rbnf
      data.cache(:rbnf, @base_locale, :rbnf, @rbnf_key, resolve_alias: false) do |source|
        raise RuntimeError, "could not find RBFN for #{@base_locale}/#{@rbnf_key}" unless source
        Nii::RBNF.load(source)
      end
    end
  end
end
