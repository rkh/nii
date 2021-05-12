# frozen_string_literal: true

module Nii::Setup::Shared
  module Locales
    # @api setup
    #
    # Sets a fixed locale, skipping any locale negotiation.
    # Useful if locales are solely determined by domain.
    #
    # @example
    #   Nii::Setup.new MyApp do
    #     domain("example.com") { locale "en-US" }
    #     domain("beispiel.de") { locale "de-DE" }
    #   end
    def locale(value = Nii::UNDEFINED) = set(:locale, value) { |l| Nii::Locale.new(l) }

    # @api setup
    # (see Nii::Setup::Vanilla#available_locales)
    def available_locales(*values)
      self[:available_locales] = Nii::LocalePreference.new(values) if values.any?
      self[:available_locales]
    end

    alias_method :locales, :available_locales
  end
end
