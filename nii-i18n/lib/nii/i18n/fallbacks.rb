# frozen_string_literal: true

module Nii::I18n
  # Replaces I18n::Locale::Fallbacks to have fallback logic be determined by Nii.
  #
  # @example
  #   I18n.fallbacks = Nii::I18n::Fallbacks.new(Nii.setup { on('gsw') { fallback_locale 'de-CH' }})
  #   I18n.fallbacks["de"]  # => ["de", "und", "root"]
  #   I18n.fallbacks["gsw"] # => ["gsw", "und", "root", "de-CH", "de"]
  class Fallbacks
    # @param config [Hash, Nii::Config, #to_nii_config]
    def initialize(config = {}) = @config = Nii::Config.new(config)

    # @param locale [String, Symbol, Nii::Locale]
    # @return [Array<String>]
    def [](locale) = Nii::Context.new(@config) { |c| c.locale = locale }.lookup_chain
  end
end
