# frozen_string_literal: true

module Nii::Setup::Shared
  module Conditional
    include Config
  
    # @api internal
    def initialize
      @children = []
      @locale ||= Nii::Locale.new
      super
    end

    # @api internal
    def to_nii_config
      prepare_config
      configs = []
      @children.each do |child|
        next unless config = child.to_nii_config and !reject?(config)
        combinations = configs.map { |c| c.merge(c) }.compact
        combinations.reject! { |c| reject? c }
        configs.prepend(*combinations)
        configs.append(config)
      end
      Nii::ConditionalConfig.new(@locale, @config, *configs)
    end

    # @api setup
    #
    # Create a new locale dependent scope.
    #
    # @example
    #   Nii::Setup.new do
    #     # you can pass locale identifiers
    #     on "de-CH", "de-AT" do
    #       # have Swiss Standard German and Austrian German
    #       # fall back to Standard German
    #       fallback_locale "de-DE"
    #     end
    #
    #     # you can pass a hash with conditions
    #     on territory: "US" do
    #       currency "USD"
    #     end
    #
    #     # you can also combine the two
    #     on "en", "es", territory: "US" do
    #       measurement_system "US"
    #     end
    #
    #     # these can also be nested
    #     on "de" do
    #       # default to EUR for everything in German
    #       currency "EUR"
    #       # except in Switzerland
    #       on(territory: "CH") { currency "CHF" }
    #     end
    #   end
    #
    # @return [Nii::Setup::Locale]
    def on(code = nil, **options)
      options = options.reject { |k, v| v.nil? }
      return self if code.nil? and options.empty?
      locale = @locale & Nii::Locale.new(code, **options)
      setup  = Nii::Setup::Locale.new(locale, self)
      implicit_locales << locale if locale.respond_to?(:language) and locale.language
      @children << setup
      setup
    end
  end
end
