# frozen_string_literal: true

module Nii::Setup::Shared
  module Context
    # @api setup
    #
    # Lets Nii dynamically determine the fallback locale based on user preferences.
    #
    # If this is enabled, the client's locale preference, which is typically based on the
    # Accept-Language header for web applications, is used not only to determine the best
    # locale to use, but also its fallback locale.
    #
    # Ruby I18m gives us a few examples in their documentation:
    # > "People speaking Arabian as spoken in Palestine also speak Hebrew as spoken in Israel. […]
    # > People speaking Sami as spoken in Finland also speak Swedish and Finnish as spoken in Finland."
    # > – Ruby I18n fallback documentation
    #
    # This setting lets you implement exactly this feature, but instead of making assumptions about
    # a user's language knowledge, it lets the user tell us what languages would be acceptable options.
    # This preference is most commonly configured via or determined by the operating system or web browser.
    # The user does not have to configure this for your application specifically.
    #
    # We do not recommend making assumptions about the user's language knowledge, unless you have an extremely
    # high certainty (like setting Swiss Standard German as a fallback for Swiss German, or assuming your audience
    # speaks English when providing content for software developers).
    #
    # @example
    #   setup = Nii::Setup.new do
    #     available_locales "en", "de", "fr"
    #     auto_fallbacks
    #   end
    #
    #   # this part is automatically handled by Nii::Middleware
    #   # and only used for illustration
    #   accept_language = "gsw-CH, de-CH, fr-CH, en"
    #   context         = Nii::Context.new(accept_language, setup)
    #
    #   # gsw-CH gets filtered out, as it isn't supported
    #   context.locale           # => Nii::Locale["de-CH"]
    #   context.fallback_locales # => [Nii::Locale["fr-CH"], Nii::Locale["en"]]
    #
    # @default false
    def auto_fallbacks(value = true) = set(:auto_fallbacks, value)
  
    # @api setup
    #
    # Sets the encoding used for formatting strings.
    # It is recommended to only use Unicode based encodings, as many features (including bi-directional text and collation)
    # might not be available otherwise.
    #
    # @example
    #   Nii::Setup.new MyApp do
    #     encoding "UTF-16"
    #   end
    #
    # @default UTF-8
    def encoding(value = Nii::UNDEFINED) = set(:encoding, value)

    # @api setup
    #
    # Defines a fallback locale. It is used for message lookup if a message isn't defined for the current locale.
    #
    # This is different from inheritance: `fr-Latn-CH` will automatically inherit messages from `fr-CH`,
    # `fr-Latn`, and `fr`.
    #
    # This option can be used to immitade Ruby I18n's `fallback` and `default_locale` settings.
    # It is very flexible in combination with `on`, `setup`, and `domain`.
    #
    # @example
    #   Nii::Setup.new do
    #     # set fallback for all locales to American English
    #     fallback_locale "en-US"
    #
    #     # set fallback locale for Norwegian Nynorsk
    #     # to Norwegian Bokmål and EU English
    #     on language: "nn" do
    #       fallback_locales "nb", "en-150"
    #     end
    #   end
    def fallback_locales(*values) = set(:fallback_locales, values.any? ? values.flatten : Nii::UNDEFINED)
    alias_method :fallback_locale, :fallback_locales

    # @api setup
    #
    # This option will cause fallbacks to be filtered based on user preference.
    #
    # It is similar to {#auto_fallbacks}, but will only choose fallbacks from the pre-defined
    # fallback locales, and also maintain the configuration order.
    #
    # @default false
    def filter_fallbacks(value = true) = set(:filter_fallbacks, value)

    # @api setup
    #
    # Overrides the measurement system. Valid values are `US`, `UK`, and `metric`.
    #
    # @example
    #   Nii::Setup.new do
    #     on(territory: 'GB') { measurement_system "metric" }
    #   end
    def measurement_system(value = Nii::UNDEFINED) = set(:measurement_system, value)

    # @api setup
    #
    # Sets the default namespace to be used for `find_message` (and thus `render`).
    #
    # @example
    #   Nii::Setup.new MyApp do
    #     domain "www.my-page.com" do
    #       namespace "web"
    #     end
    #
    #     domain "admin.my-page.com" do
    #       namespace "web/admin"
    #     end
    #   end
    def namespace(value = Nii::UNDEFINED) = set(:namespace, value)
    alias_method :default_namespace, :namespace

    # @api setup
    #
    # The default numbering system to use for formatting numbers.
    #
    # This can be set to a numbering system identifier (like `latn` or `arab`),
    # or one of the placeholder names `default`, `native`, `traditional`, and `finance`,
    # in which case Nii will pick the most appropriate numbering system for each locale.
    #
    # @example
    #   Nii::Setup.new do
    #     # enable traditional numbers for languages that support it (like Chinese)
    #     numbering_system "traditional"
    #
    #     on "la" do
    #       # use Roman numerals for Latin
    #       numbering_system "roman"
    #     end
    #   end
    #
    # @default default
    def numbering_system(value = Nii::UNDEFINED) = set(:numbering_system, value)
    alias_method :numbers, :numbering_system
  
    # @api setup
    #
    # Enables automatic message template reloading whenever localization files change.
    # Framework integrations like nii-rails and nii-sinatra will typically set this
    # option for you in development mode.
    #
    # @example
    #   Nii::Setup.new do
    #     reload_templates if ENV["RACK_ENV"] == "development"
    #   end
    #
    # @default false
    def reload_templates(value = true) = set(:reload_templates, value)

    # @api setup
    #
    # The rounding mode to be used when formatting numbers.
    #
    # Available modes:
    #
    # * `halfeven` - Values exactly on the 0.5 (half) mark are rounded to the nearest even digit.
    #   This is often called Banker’s Rounding because it is, on average, free of bias.
    #   It is the default mode specified for IEEE 754 floating point operations, as well as the default used by Unicode/ICU.
    # * `halfodd` – Similar to `halfeven`, but rounds ties to the nearest odd number instead of even number.
    # * `halfdown` – Values exactly on the 0.5 (half) mark are rounded down (next smaller absolute value, towards zero).
    # * `halfup` – Values exactly on the 0.5 (half) mark are rounded up (next larger absolute value, away from zero).
    # * `down` – All values are rounded towards the next smaller absolute value (rounded towards zero). This is similar to Ruby's `to_i`.
    # * `up` – All values are rounded towards the next greater absolute value (away from zero).
    # * `halfceiling` – Values exactly on the 0.5 (half) mark are rounded toward positive infinity (+∞). This is the same as Ruby's `round` method.
    # * `halffloor` – Values exactly on the 0.5 (half) mark are rounded towards negative infinity (-∞).
    # * `ceiling` – All values are rounded towards positive infinity (+∞). This is the same as Ruby's `ceil` method.
    # * `floor` - All values are rounded towards negative infinity (-∞). This is the same as Ruby's `floor` method.
    # * `unnecessary` - The mode “Unnecessary” doesn’t perform any rounding, but instead returns an error if the value cannot be represented exactly without rounding.
    #
    # @default halfeven
    def rounding_mode(value = Nii::UNDEFINED) = set(:rounding_mode, value)

    # @api setup
    #
    # Overrides the territory.
    #
    # The territory is exposed via Context#territory and used to determine measurement system, calendar, currency, etc.
    #
    # Setting this option will not impact message lookup – it therefore works similar to the region override Unicode extension, except that it is
    # set by the server instead of the client, and takes priority (it overrides the override).
    #
    # @example
    #   Nii::Setup.new MyApp do
    #     domain("beispiel.de") { territory "DE" }
    #     domain("beispiel.ch") { territory "CH" }
    #   end
    def territory(value = Nii::UNDEFINED) = set(:territory, value)

    # @api setup
    #
    # Overrides the timezone. Th timezone exposed via Context#timezone and used for date and time formatting.
    #
    # @example
    #   Nii::Setup.new do
    #     domain("web.co.uk") { timezone "Europe/London" }
    #   end
    def timezone(value = Nii::UNDEFINED) = set(:timezone, value)
  end
end
