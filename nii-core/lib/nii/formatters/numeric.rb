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
      numberingSystem:          :numbering_system,
      signDisplay:              :display_sign,
      useGrouping:              :use_grouping,
      minimumIntegerDigits:     :min_integers,
      minimumFractionDigits:    :min_precision,
      maximumFractionDigits:    :max_precision,
    }
    private_constant :ECMA_OPTIONS

    # compactDisplay, currency, currencySign, currencyDisplay, unit, unitDisplay, notation, minimumSignificantDigits, maximumSignificantDigits

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
    #   This option is compatible with the ECMAScript +signDisplay+, which it accepts as an alias (in which case +except_zero+ will be
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
    # @option options [String, Symbol] style ("default")
    #   Style to use for number formatting:
    #   * +"default"+ for plain number formatting using the current numbering system, even if it isn't decimal based.
    #   * +"decimal"+ for plain number formatting using a decimal system (either the current numbering system or latn).
    #   * +"currency"+ for currency formatting.
    #   * +"percent"+ for percent formatting.
    #   * +"unit"+ for unit formatting.
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

      options[:min_precision] ||= options[:precision]
      options[:max_precision] ||= options[:precision]
      options[:round] = true if options[:max_precision] and options[:round].nil?
      options[:round] = context.config.rounding_mode || :halfeven if options[:round] == true

      case options[:style]&.to_s || 'default'
      when 'default'    then format_default(numbers,  value, **options)
      when 'decimal'    then format_decimal(numbers,  value, **options)
      when 'currency'   then format_currency(numbers, value, **options)
      when 'percent'    then format_percent(numbers,  value, **options)
      when 'unit'       then format_unit(numbers,     value, **options)
      else raise ArgumentError, "unsupported style: #{unit}"
      end
    end

    private

    def round(value, mode, precision)
      return value unless mode
      case mode.to_sym.downcase
      when :ceiling, :ceil then value.ceil(precision)
      when :floor          then value.floor(precision)
      when :down           then value.positive?  ? value.floor(precision) : value.ceil(precision)
      when :up             then value.negative?  ? value.floor(precision) : value.ceil(precision)
      when :even           then value.to_i.even? ? value.floor(precision) : value.ceil(precision)
      when :odd            then value.to_i.odd?  ? value.floor(precision) : value.ceil(precision)
      when :halfceiling    then value % 1 == 0.5 ? round(value, :ceiling, precision) : value.round(precision)
      when :halffloor      then value % 1 == 0.5 ? round(value, :floor,   precision) : value.round(precision)
      when :halfdown       then value % 1 == 0.5 ? round(value, :down,    precision) : value.round(precision)
      when :halfup         then value % 1 == 0.5 ? round(value, :up,      precision) : value.round(precision)
      when :halfeven       then value % 1 == 0.5 ? round(value, :even,    precision) : value.round(precision)
      when :halfodd        then value % 1 == 0.5 ? round(value, :odd,     precision) : value.round(precision)
      when /_|-/           then round(value, mode.to_s.tr('-_', ''), precision)
      when :unnecessary
        raise ArgumentError, "value does not match precision, but rounding mode is #{mode}"
        value
      else
        raise ArgumentError, "unsupported rounding mode #{mode}"
      end
    end

    def format_number(type, numbers, value, default_precision: 0, **options)
      system  = numbers.system(options[:numbering_system])
      symbols = numbers.symbols(system)
      symbols = symbols.merge('group' => '') if options[:use_grouping] == false
      rules   = numbers.format_rules(type, system: system)
      value   = round(value, options[:round], options[:max_precision] || default_precision)
      system.format(value, rules, symbols: symbols, **options)
    end
    
    def format_default(numbers, value, **options)
      format_number(:decimal, numbers, value, **options)
    end
    
    def format_decimal(numbers, value, numbering_system: nil, **options)
      system = numbers.system(numbering_system)
      system = numbers.system           unless system.decimal?
      system = numbers.system('native') unless system.decimal?
      system = numbers.system('latn')   unless system.decimal?
      format_number(:decimal, numbers, value, numbering_system: system, **options)
    end
    
    def format_currency(numbers, value, **options)
      raise ArgumentError, 'missing option currency for "currency" style' unless currency = options[:currency]
      options[:numbering_system] ||= 'finance'
      raise NotImplementedError
    end
    
    def format_percent(numbers, value, **options)
      raise NotImplementedError
    end

    def format_unit(numbers, value, **options)
      raise NotImplementedError
    end

    def normalize_options(options)
      options.transform_keys! ECMA_OPTIONS
      options.transform_values! { |v| Symbol === v ? v.to_s : v }
      options[:currency]         &&= options[:currency].upcase
      options[:currency_display]   = 'narrow'      if options[:currency_display] == 'narrowSymbol'
      options[:display_sign]       = 'except_zero' if options[:display_sign]     == 'exceptZero'
      options[:numbering_system] ||= options.delete(:numbers)
    end
  end
end
