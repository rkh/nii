# frozen_string_literal: true

module Nii::Info
  class Grammar < Generic
    def formality = config.formality || locale.formality || config.default_formality || 'avoid'
    alias_method :tone, :formality

    # @example
    #   context = Nii::Context.new :en
    #   context.grammar.plurals.classify(1) # => "one"
    #
    # @return [Nii::Plurals] Plural category classifier object.
    def plurals
      data.cache(:plurals, context.data_locale, :info, :plurals) do |rules|
        Nii::Plurals.new(**rules.transform_keys(&:to_sym))
      end
    end
  end
end
