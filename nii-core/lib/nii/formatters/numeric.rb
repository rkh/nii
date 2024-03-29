# frozen_string_literal: true

module Nii::Formatters
  # Fluent / Intl compatible number formatter.
  module Numeric
    # Option aliases that can be used for ECMAScript Intl compatibility.
    #
    # @see .format
    # @see
    #   https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/NumberFormat/NumberFormat
    #   Intl.NumberFormat() constructor
    ECMA_OPTIONS = {
      currencyDisplay:          :currency_display,
      currencySign:             :currency_sign,
      numberingSystem:          :numbering_system,
      signDisplay:              :display_sign,
      useGrouping:              :use_grouping,
      minimumIntegerDigits:     :min_integers,
      minimumFractionDigits:    :min_precision,
      maximumFractionDigits:    :max_precision,
    }
    private_constant :ECMA_OPTIONS

    # compactDisplay, unit, unitDisplay, notation, minimumSignificantDigits, maximumSignificantDigits

    extend self

    # This method is called by {Nii::Context#format} for all Numeric objects (unless a more specific formatter exists for them).
    # This includes Integer, Float, Rational, and BigDecimal objects, as well as any custom subclasses of Numeric.
    #
    # @param context [Nii::Context]
    #   Localization context to use for formatting.
    #
    # @param value [::Numeric]
    #   Number to format.
    #
    # @param options [Hash]
    #   A customizable set of options. Unknown and unsupported options are ignored.
    #   Multiple options have aliases. Which option is picked if both the proper option and its alias are passed is undefined behavior
    #   (with the current implementation, this is order depended, with later options overriding earlier options).
    #
    # @option options [true, false] cash (false)
    #   When currency formatting is used, treat the amount as cash amount. This may impact rounding behavior and decimal point usage,
    #   depending on the currency and locale. If this option is provided, the +style+ option will default to +currency+.
    #
    # @option options [String, Symbol, Nii::Currency] currency
    #   The currency to use when using currency style formatting. If this option is provided, the +style+ option will default
    #   to +currency+. You can provide a three letter ISO/CLDR code (+USD+, +EUR+), or a {Nii::Currency} instance.
    #   If this option isn't provided, but currency formatting is used, it will default to {Nii::Context#currency}.
    #   This options is case-insensitive.
    #
    #   This option is compatible with the ECMAScript +currency+ option.
    #
    # @option options [String, Symbol] currency_display (:symbol)
    #   How to display the currency in currency formatting. Possible values are:
    #   * +symbol+: use a localized currency symbol such as $ or US$ (depending on locale).
    #   * +narrow+: use a narrow format symbol ("$100" rather than "US$100", depending on locale).
    #   * +code+: use the ISO currency code ("USD")
    #   * +name+: use the currency name, such as "dollar" (depending on locale).
    #
    #   This option is compatible with the ECMAScript +currencyDisplay+ option, which it supports as an alias,
    #   and also accepts +narrowSign+ instead of +narrow+.
    #
    # @option options [String, Symbol] currency_sign (:standard)
    #   In many locales, accounting format means to wrap the number with parentheses instead of appending a minus sign.
    #   You can enable this formatting by setting the +currency_sign+ option to +accounting+.
    #
    #   This option is compatible with the ECMAScript +currencySign+ option, which it supports as an alias.
    #
    # @option options [String, nil] currency_symbol (nil)
    #   Overrides the currency symbol used for currency formatting (when +currency_display+ is set to +symbol+ or +narrow+).
    #
    # @option options [String, nil] currency_name (nil)
    #   Overrides the currency name used for currency formatting (when +currency_display+ is set to +name+).
    #
    # @option options [String, Symbol] display_sign (auto)
    #   Whether or not to display a plus or minus sign before the number (actual sign and position may depend on other factors, like the
    #   numbering system used, as well as region or language based preferences).
    #
    #   Available options are:
    #   * +auto+ – display sign for negative numbers only.
    #   * +never+ – never display sign.
    #   * +always+ – always display sign.
    #   * +except_zero+ – display sign for positive and negative numbers, but not zero.
    #
    #   This option is compatible with the ECMAScript +signDisplay+ option, which it accepts as an alias (in which case +except_zero+ will be
    #   +exceptZero+).
    #
    # @option options [Integer] max_precision
    #   The maximum number of fraction digits to use.
    #   This options is compatible with the ECMAScript +maximumFractionDigits+ option, which it also accepts as an alias.
    #
    # @option options [Integer] min_integers
    #   The minimum number of integer digits to use.
    #   This options is compatible with the ECMAScript +minimumIntegerDigits+ option, which it also accepts as an alias.
    #
    # @option options [Integer] min_precision
    #   The minimum number of fraction digits to use.
    #   This options is compatible with the ECMAScript +minimumFractionDigits+ option, which it also accepts as an alias.
    #
    # @option options [String, Symbol] numbering_system ("default")
    #   The numbering system to use. Available options are:
    #   * +default+, +native+, +traditional+, and +finance+:
    #     Will let {Nii::Info::Numbers} choose the most appropriate numbering system based on locale and configuration.
    #   * Any numbering system part of the Unicode Common Locale Data Repository. These are currently:
    #     +adlm+, +ahom+, +arab+, +arabext+, +armn+, +armnlow+, +bali+, +beng+, +bhks+, +brah+, +cakm+, +cham+, +cyrl+, +deva+, +diak+,
    #     +ethi+, +fullwide+, +geor+, +gong+, +gonm+, +grek+, +greklow+, +gujr+, +guru+, +hanidays+, +hanidec+, +hans+, +hansfin+, +hant+,
    #     +hantfin+, +hebr+, +hmng+, +hmnp+, +java+, +jpan+, +jpanfin+, +jpanyear+, +kali+, +khmr+, +knda+, +lana+, +lanatham+, +laoo+,
    #     +latn+, +lepc+, +limb+, +mathbold+, +mathdbl+, +mathmono+, +mathsanb+, +mathsans+, +mlym+, +modi+, +mong+, +mroo+, +mtei+, +mymr+,
    #     +mymrshan+, +mymrtlng+, +newa+, +nkoo+, +olck+, +orya+, +osma+, +rohg+, +roman+, +romanlow+, +saur+, +segment+, +shrd+, +sind+,
    #     +sinh+, +sora+, +sund+, +takr+, +talu+, +taml+, +tamldec+, +telu+, +thai+, +tibt+, +tirh+, +vaii+, +wara+, +wcho+.
    #
    #   This option may be ignored if the format requires a decimal system but the chosen numbering system isn't decimal based, or
    #   if the value is out of scope for the system (like trying to format floating point numbers as Roman numerals).
    #
    #   This options is compatible with the ECMAScript +numberingSystem+ option, which it also accepts as an alias.
    #   In addition, you can use the alias +numbers+.
    #
    # @option options [Integer] precision
    #   Sets both +min_precision+ and +max_precision+ to the same value.
    #
    # @option options [Symbol, String, true] round
    #   Rounding mode to use. If you supply this without setting the precision, the used precision will depend on
    #   the style (0 for default/decimal formatting).
    #
    #   Available modes:
    #   * +:halfeven+ - Values exactly on the 0.5 (half) mark are rounded to the nearest even digit.
    #     This is often called Banker’s Rounding because it is, on average, free of bias.
    #     It is the default mode specified for IEEE 754 floating point operations, as well as the default used by Unicode/ICU.
    #     It is also Nii's default unless overridden by +config.rounding_mode+.
    #   * +:halfodd+ – Similar to +:halfeven+, but rounds ties to the nearest odd number instead of even number.
    #   * +:halfdown+ – Values exactly on the 0.5 (half) mark are rounded down (next smaller absolute value, towards zero).
    #   * +:halfup+ – Values exactly on the 0.5 (half) mark are rounded up (next larger absolute value, away from zero).
    #   * +:down+ – All values are rounded towards the next smaller absolute value (rounded towards zero). This is similar to Ruby's Float#to_i.
    #   * +:up+ – All values are rounded towards the next greater absolute value (away from zero).
    #   * +:halfceiling+ – Values exactly on the 0.5 (half) mark are rounded toward positive infinity (+∞). This is the same as Ruby's #round method.
    #   * +:halffloor+ – Values exactly on the 0.5 (half) mark are rounded towards negative infinity (-∞).
    #   * +:ceiling+ – All values are rounded towards positive infinity (+∞). This is the same as Ruby's #ceil method.
    #   * +:floor+ - All values are rounded towards negative infinity (-∞). This is the same as Ruby's #floor method.
    #   * +:unnecessary+ - The mode “Unnecessary” doesn’t perform any rounding, but instead returns an error if the value cannot be represented exactly without rounding.
    #   * +true+ - uses the default rounding mode (+config.rounding_mode+ or +:halfeven+).
    #
    #   If this option isn't set, or the format results in a lower precision than is set via the options, the formatter may or may not
    #   choose to round the value, and might choose a different rounding mode than the default depending on other options and locale data.
    #
    #   This option is compatible with ICU, IEEE 754, and Java 7 rounding modes.
    #
    # @option options [Integer] rounding_increment (1)
    #   The multiple of +max_precision+ to round the value to.
    #   Setting +precision+ to 2 and +rounding_increment+ to 5 will round the value to a multiple of 0.05.
    #
    # @option options [String, Symbol] style
    #   Style to use for number formatting:
    #   * +"default"+ for plain number formatting using the current numbering system, even if it isn't decimal based.
    #   * +"decimal"+ for plain number formatting using a decimal system (either the current numbering system or latn).
    #   * +"currency"+ for currency formatting.
    #   * +"percent"+ for percent formatting.
    #   * +"unit"+ for unit formatting.
    #
    #   If not provided +"default"+, +"currency"+, or +"unit"+ will be used depending on other options.
    #
    #   This option is compatible with the ECMAScript +style+ option, except for its +"default"+ behavior (ECMAScript
    #   does not have this option and defaults to +"decimal"+).
    #
    # @option options [true, false] use_grouping (true)
    #   Whether to use grouping separators, such as thousands separators or thousand/lakh/crore separators.
    #   This options is compatible with the ECMAScript +useGrouping+ option, which it also accepts as an alias.
    #
    # @!scope module
    def format(context, value, **options)
      normalize_options(options)
      numbers = context.numbers

      if precision = options[:precision]
        options[:min_precision] ||= precision
        options[:max_precision] ||= precision
      end

      options[:round]            = true if options[:max_precision] and options[:round].nil?
      options[:round]            = context.config.rounding_mode || :halfeven if options[:round] == true
      options[:style]          ||= 'unit'     if options[:unit]
      options[:style]          ||= 'currency' if options[:currency] or options[:cash]
      options[:spellout_rules] ||= context.numbers.spellout_rules

      case Utils.string(options[:style] || 'default')
      when 'default'    then format_default   numbers, value, **options
      when 'decimal'    then format_decimal   numbers, value, **options
      when 'currency'   then format_currency  numbers, value, **options
      when 'percent'    then format_percent   numbers, value, **options
      when 'unit'       then format_unit      numbers, value, **options
      else raise ::Nii::Errors::FormatError, "unsupported style: #{options[:style].inspect}"
      end
    end

    # @param  (see #format)
    # @option (see #format)
    # @!scope module
    def spellout(context, value, **options) = format(context, value, spellout: true, **options)

    private

    def round(value, mode, precision, increment = nil)
      return value unless mode
      increment   = nil if mode == :unnecessary
      increment &&= increment > 0 ? increment.to_r : nil
      value /= increment.to_r if increment

      case mode.to_sym.downcase
      when :ceiling, :ceil then value = value.ceil(precision)
      when :floor          then value = value.floor(precision)
      when :down           then value = value.positive? ? value.floor(precision) : value.ceil(precision)
      when :up             then value = value.negative? ? value.floor(precision) : value.ceil(precision)
      when :even           then value = value.negative? ^ value.to_i.even? ? value.floor(precision) : value.ceil(precision)
      when :odd            then value = value.negative? ^ value.to_i.odd?  ? value.floor(precision) : value.ceil(precision)
      when :halfceiling    then value = value % 1 == 0.5 ? round(value, :ceiling, precision) : value.round(precision)
      when :halffloor      then value = value % 1 == 0.5 ? round(value, :floor,   precision) : value.round(precision)
      when :halfdown       then value = value % 1 == 0.5 ? round(value, :down,    precision) : value.round(precision)
      when :halfup         then value = value % 1 == 0.5 ? round(value, :up,      precision) : value.round(precision)
      when :halfeven       then value = value % 1 == 0.5 ? round(value, :even,    precision) : value.round(precision)
      when :halfodd        then value = value % 1 == 0.5 ? round(value, :odd,     precision) : value.round(precision)
      when /_|-/           then value = round(value, mode.to_s.tr('-_', ''), precision)
      when :unnecessary
        rounded = value.round(precision)
        return rounded if rounded == value
        raise ArgumentError, "value does not match precision, but rounding mode is #{mode}"
      else
        raise ArgumentError, "unsupported rounding mode #{mode}"
      end

      increment ? value * increment : value
    end

    def format_number(type, numbers, value, default_precision: 0, subtype: nil, rounding_increment: nil, **options)
      system     = numbers.system(options[:numbering_system])
      symbols    = numbers.symbols(system)
      symbols    = symbols.merge('group' => '') if options[:use_grouping] == false
      rules      = numbers.format_rules(type, subtype, system: system) if subtype
      rules    ||= numbers.format_rules(type, system: system)
      precision  = options[:max_precision] || default_precision
      precision += 2 if type == :percent
      value      = round(value, options[:round], precision, rounding_increment)
      system.format(value, rules, symbols: symbols, **options)
    end
    
    def format_default(numbers, value, **options)
      return spell(value, **options) if options[:spellout]
      format_number(:decimal, numbers, value, **options)
    end

    def spell(value, spellout_rule: nil, **options)
      value         = round(value, options[:round], options[:max_precision] || options[:default_precision] || 0, options[:rounding_increment])
      rules         = options.fetch(:spellout_rules)
      spellout_rule = spellout_rule.flatten.compact.join('-') if spellout_rule.is_a? ::Array
      spellout_rule = Utils.string(spellout_rule)
      spellout_rule = 'numbering' if spellout_rule == ''
      spellout_rule = "numbering-#{spellout_rule}" if spellout_rule == 'year' or spellout_rule == 'verbose'
      spellout_rule = "cardinal-#{spellout_rule}" unless spellout_rule =~ /^(?:numbering|cardinal|ordinal)/
      options.fetch(:spellout_rules).format(value, "spellout-#{spellout_rule}")
    rescue ::Nii::RBNF::MissingRuleSet
      raise if spellout_rule == 'numbering' # should not be the case as this is defined for root locale, but lets be safe
      spell(value, spellout_rule: spellout_rule.sub(/-?[^-]+$/, ''), **options)
    end
    
    def format_decimal(numbers, value, numbering_system: nil, **options)
      raise ::Nii::Errors::FormatError, 'cannot combine declimal formatting and spellout' if options[:spellout]
      system = numbers.system(numbering_system)
      system = numbers.system           unless system.decimal?
      system = numbers.system('native') unless system.decimal?
      system = numbers.system('latn')   unless system.decimal?
      format_number(:decimal, numbers, value, numbering_system: system, **options)
    end
    
    def format_currency(numbers, value, cash: false, currency: nil, currency_symbol: nil, currency_name: nil, currency_display: nil, currency_sign: nil, **options)
      return format_default(numbers, value, min_precision: 2, max_precision: 2, **options) unless currency = numbers.currency(currency)
      currency_display               = Utils.symbol(currency_display) if currency_display
      currency_display               = :spellout if options[:spellout]
      data_locale                    = numbers.context.data_locale
      options[:default_precision]  ||= cash ? currency.cash_digits   : currency.digits
      options[:rounding_increment] ||= cash ? currency.cash_rounding : currency.rounding
      options[:min_precision]      ||= cash && value == value.round ? 0 : options[:default_precision]

      case currency_display ||= :symbol
      when :symbol, :narrow
        options[:min_precision]    ||= options[:default_precision]
        options[:numbering_system] ||= 'finance'

        case currency_symbol ||= currency_display
        in ::String                                then symbol = currency_symbol
        in ::Symbol                                then symbol = currency.symbol(style: currency_symbol, locale: data_locale)
        in ::Hash if symbol[currency_display]      then symbol = currency_symbol[currency_display]
        in ::Hash if symbol[currency_display.name] then symbol = currency_symbol[currency_display.name]
        in ::Hash if symbol[:default]              then symbol = currency_symbol[:default]
        in ::Hash if symbol['default']             then symbol = currency_symbol['default']
        else                                            symbol = currency.symbol(locale: data_locale)
        end

        format_number(:currency, numbers, value, subtype: currency_sign, **options).sub(/(.)?¤(.)?/) do
          before, after    = $1, $2
          currency_spacing = numbers.format_rules(:currency, :currency_spacing)
          if insert = space_currency(currency_spacing['before_currency'], before, symbol[0])
            symbol = "#{insert}#{symbol}"
          end
          if insert = space_currency(currency_spacing['after_currency'], after, symbol[-1])
            symbol = "#{symbol}#{insert}"
          end
          "#{before}#{symbol}#{after}"
        end
      when :code, :name
        value           = format_number(:decimal, numbers, value, **options)
        category        = numbers.plural_category(value).name
        unit_pattern    = numbers.format_rules :currency, :unit_pattern
        unit_pattern    = unit_pattern.fetch(category, unit_pattern.fetch('other'))
        currency_name   = currency.code if currency_display == :code
        currency_name ||= currency.display_name(locale: data_locale, style: category)
        unit_pattern.sub('{0}', value).sub('{1}', currency_name) # todo: support short etc
      when :spellout, :spell_out
        category                  = numbers.plural_category(value).name
        patterns                  = numbers.format_rules :currency, :unit_pattern
        pattern                   = patterns.fetch(category, patterns.fetch('other'))
        options[:spellout_rule] ||= 'cardinal-neuter' # will automatically fall back to cardinal – todo: figure out if we can get this from CLDR
        pattern.sub('{0}', spell(value, **options)).sub('{1}', currency.display_name(locale: data_locale, style: category))
      else
        raise ArgumentError, "unsupported currency display: #{currency_display.inspect}"
      end
    end
    
    def format_percent(numbers, value, **options)
      raise ::Nii::Errors::FormatError, 'cannot combine declimal formatting and spellout' if options[:spellout]
      format_number(:percent, numbers, value, **options)
    end

    def format_unit(numbers, value, **options)
      raise NotImplementedError
    end

    def space_currency(rule, surrounding, currency)
      return unless rule
      return unless ::Nii::Parser.unicode_set(rule['currency_match'])    =~ currency
      return unless ::Nii::Parser.unicode_set(rule['surrounding_match']) =~ surrounding
      rule['insert_between']
    end

    def normalize_options(options)
      options.transform_keys! ECMA_OPTIONS
      options.transform_values! { |v| Symbol === v ? v.name : v }
      options[:currency_display]   = 'narrow'      if options[:currency_display] == 'narrowSymbol'
      options[:display_sign]       = 'except_zero' if options[:display_sign]     == 'exceptZero'
      options[:numbering_system] ||= options.delete(:numbers)
    end
  end
end
