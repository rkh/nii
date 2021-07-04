# frozen_string_literal: true

module Nii::Setup
  # Setup scope inside an `on` block.
  class Locale
    include Shared, Shared::Context, Shared::Conditional, Shared::Load

    # @api internal
    def initialize(locale, parent)
      @locale, @parent = locale, parent
      super()
    end

    # @api setup
    # Overrides the locale ID used for looking up CLDR data.
    #
    # This setting will not impact message lookup, and may lead to unexpected
    # consequences if the messages are written in a different script than
    # correspond to the data locale (like when setting Arabic as the data locale
    # for English).
    #
    # The most common use case is to support a custom locale identifier you invented
    # yourself. Though you might be better of using a variant instead (if you use
    # `en-pirate` instead of `pirate` Nii will automatically pick "en" as data locale).
    #
    # @example
    #   setup = Nii::Setup.new do
    #     on(language: "en") { data_locale "fr" }
    #   end
    #
    #   # Nii will now use "fr" to look up data in the CLDR
    #   context = Nii::Context.new("en-US", setup)
    #   context.format "US", as: :region # => "États-Unis"
    def data_locale(value = Nii::UNDEFINED) = set(:data_locale, value)

    protected

    def [](key) = super { @parent[key] }

    private

    def base_setup       = parent.base_setup
    def implicit_locales = base_setup.implicit_locales
  end
end
