# frozen_string_literal: true

module Nii::Formatters
  module String
    extend self

    # Allows plugins to register their own +as+ option.
    # @return [Hash{Symbol => #format, String}]
    # @api internal
    FORMAT_AS = { region: 'territory', country: 'territory', numbers: 'numbering_system', calendar_algorithm: 'calendar' }

    # Called by Nii::Context#format to determine whether the result needs HTML escaping.
    # @api internal
    def escape?(value, **options)
      return true unless value.respond_to? :html_safe?
      return true if options[:as]
      value.html_safe?
    end

    # Formats a string.
    #
    # @example Plain string formatting
    #   context = Nii::Context.new
    #   result  = context.format "a > b" # => "a &gt; b"
    #   result.html_safe? # => true
    #
    #   # Without escaping
    #   context.format "a > b", escape_html: false # => "a > b"
    #
    # @example HTML safe strings (Nii)
    #   context = Nii::Context.new
    #   context.format context.html("<a>b</a>")          # => "<a>b</a>"
    #   context.format context.html("<a>?</a>", "a > b") # => "<a>a &gt; b</a>
    #
    # @example HTML safe strings (Rails)
    #   context = Nii::Context.new
    #   context.format "<a>b</a>".html_safe           # => "<a>b</a>"
    #   context.format "<a>?</a>".html_safe % "a > b" # => "<a>a &gt; b</a>""
    #
    # @example Various :as options
    #   context = Nii::Context.new :de
    #
    #   context.format "chinese",    as: :calendar                 # => "Chinesischer Kalender"
    #   context.format "standard",   as: :collation                # => "Standard-Sortierung"
    #   context.format "USD",        as: :currency                 # => "US-Dollar"
    #   context.format "afternoon2", as: :day_period               # => "Nachmittag"
    #   context.format "currency",   as: :key                      # => "Währung"
    #   context.format "fr",         as: :language                 # => "Französisch"
    #   context.format "metric",     as: :measurement_system       # => "metrisches System"
    #   context.format "1530",       as: :number                   # => "1.530"
    #   context.format "arab",       as: :numbering_system         # => "Arabisch-indische Ziffern"
    #   context.format "US",         as: :territory                # => "Vereinigte Staaten"
    #   context.format "US",         as: :territory, style: :short # => "USA"
    #   context.format "Hebr",       as: :script                   # => "Hebräisch"
    #   context.format "inch",       as: :unit                     # => "Zoll"
    #   context.format "1996",       as: :variant                  # => "Neue deutsche Rechtschreibung"
    #
    # @param context [Nii::Context]
    #   Localization context to use for formatting.
    #
    # @param value [::String, Nii::HTMLString, ActiveSupport::SafeBuffer]
    #   String to format.
    #
    # @option options [String, Symbol] as (nil)
    #   Lets the formatter know what entity the string represents.
    #   Possible values include:
    #   * +calendar+ – interpret string as CLDR calendar identifier. Case-insensitive.
    #   * +collcation+ – interpret string as CLDR collation identifier. Case-insensitive.
    #   * +currency+ – interpret string as currency code. Case-insensitive.
    #   * +day_period+ – interpret string as day period.
    #   * +key+ – interpret string as CLDR field identifier. Case-insensitive.
    #   * +language+ – interpret the string as a language code. Case-insensitive.
    #   * +measurement_system+ – interpret string as measurement system identifier. Case-insensitive.
    #   * +number+ - use number formatting, accepts the same options as {Nii::Formatters::Numeric.format}.
    #   * +numbering_system+ or +numbers+ – interpret string as numbering system identifier. Case-insensitive.
    #   * +territory+, +country+ or +region+ – interpret the string as a CLDR territory code. Case-insensitive.
    #   * +timezone+ – interpret the string as a timezone identifier.
    #   * +script+ – interpret the string as a CLDR script code. Case-insensitive.
    #   * +unit+ – interpret the string as a unit identifier. Case-insensitive.
    #   * +variant+ – interpret the string as a CLDR language variant code. Case-insensitive.
    #
    # @see Nii::Context#format
    # @!scope module
    def format(context, value, **options)
      return value.to_str unless as = options.delete(:as)
      as     = FORMAT_AS[as.to_sym] || Utils.string(as)
      method = options.fetch(:_method, :format)
      if as.is_a? ::String
        method = "#{method}_as_#{as}"
        return public_send(method, context, value, **options) if respond_to? method
        raise ArgumentError, "unsupported string format: #{as.inspect}" unless options[:complain] == false
        value.to_str
      elsif as.respond_to? method
        as.public_send(method, context, value, **options)
      else
        raise Errors::FormatError, "Cannot format String with #{as.inspect} (does not implement #{method})"
      end
    end

    # Attempts to spell out the string (only implemented for certain "as" targets, like number).
    # @see Nii::Context#spellout
    # @see #format
    def spellout(context, value, **options) = format(context, value, _method: :spellout, **options)

    # Formats a string as a calendar identifier.
    #
    # @overload format(context, value, as: :calendar, **options)
    # @option (see #format_as_key)
    def format_as_calendar(context, value, **options) = format_as_key(context, ['calendar', value.downcase], **options)

    # Formats a string as a collation identifier.
    #
    # @overload format(context, value, as: :collation, **options)
    # @option (see #format_as_key)
    def format_as_collation(context, value, **options) = format_as_key(context, ['collation', value.downcase], **options)

    # Formats a string as a currency, where the given string is the currency's code.
    # @overload format(context, value, as: :currency, **options)
    # @option (see #get_name)
    # @!scope module
    def format_as_currency(context, value, **options)
      key = value.upcase
      get_name(context, value, **options) do |style|
        next context.locale_data(:names, :currencies, key, :symbol) if style == :short or style == :symbol
        context.locale_data(:names, :currencies, key, :display_name, style)
      end
    end

    def format_as_currency_format(context, value, **options) = format_as_key(context, ['cf', value.downcase], **options)

    # Formats a string as a day period, where the given string is a day period identifier (like "afternoon1" or "pm").
    # @overload format(context, value, as: :day_period, **options)
    #
    # @option options [String, Symbol] display ("stand-alone")
    #   * +stand-alone+: Day period used as a stand-alone noun ("afternoon").
    #   * +format+: Day period used to in a sentence or to format a time ("in the afternoon").
    #
    # @option options [String, Symbol] style ("wide")
    #   Formatting style (+wide+, +narrow+, or +abbreviated+).
    #
    # @option options [true, false] variant (false)
    #   Whether to use an alternative variant if available ("AM" vs "am" for English).
    #
    # @!scope module
    def format_as_day_period(context, value, **options)
      display = Utils.string(options[:display] || 'stand-alone')
      style   = Utils.string(options[:style]   || 'wide')
      result  = context.locale_data(:info, :calendars, :generic, :day_periods)
      result  = result[display] || result.fetch('stand-alone')
      result  = result[style]   || result.fetch('wide')
      result  = result[value]
      result  = options[:variant] ? result['variant'] || result['default'] : result['default'] if result.is_a? ::Hash
      result || value
    end

    # Formats a string as a CLDR field key.
    #
    # @overload format(context, value, as: :key, **options)
    # @option (see #get_name)
    # @!scope module
    def format_as_key(context, value, **options)
      key, subkey = ::Array === value ? value : value.downcase.split('.', 2)
      if subkey
        result = get_name(context, value, **options) { |style| context.locale_data(:names, :types, key, subkey) }
        Array === result ? result.last : result
      else
        get_name(context, value, **options) { |style| context.locale_data(:names, :keys, key) }
      end
    end

    # Formats a string as a language, where the given string is the CLDR language code.
    #
    # This only supports direct matches. For anything more advanced, you likely want to format
    # a {Nii::Locale} object instead.
    #
    # @overload format(context, value, as: :language, **options)
    # @option (see #get_name)
    # @!scope module
    def format_as_language(context, value, **options)
      key = value.sub(/^(\w+)(?:[\-_](\w+))?$/) { $2 ? "#{$1.downcase}-#{$2.upcase}" : $1.downcase }
      get_name(context, value, **options) { |style| context.locale_data(:names, :languages, key, style) }
    end

    # Formats a string as a measurement system identifier.
    #
    # @overload format(context, value, as: :measurement_system, **options)
    # @option (see #format_as_key)
    def format_as_measurement_system(context, value, **options)
      key    = ::Nii::Parser::Locale::U_SERIALIZE.dig(:measurement_system, value.upcase) || value.downcase
      result = format_as_key(context, ['ms', key], **options)
      result == key ? value : result
    end

    # Formats a string as a number.
    # @overload format(context, value, as: :number, **options)
    # @option (see Nii::Formatters::Numeric.format)
    # @!scope module
    def format_as_number(context, value, **options)
      value = ::Nii::Parser.number(value)
      context.format(value, **options)
    end

    # Spells out a string number.
    # @overload spellout(context, value, as: :number, **options)
    # @!scope module
    def spellout_as_number(context, value, **options)
      value = ::Nii::Parser.number(value)
      context.spellout(value, **options)
    end

    # Formats a string as a numbering system identifier.
    #
    # @overload format(context, value, as: :numbering_system, **options)
    # @option (see #format_as_key)
    def format_as_numbering_system(context, value, **options) = format_as_key(context, ['numbers', value.downcase], **options)

    # Formats a string as a territory, where the given string is the territory's code.
    # @overload format(context, value, as: :territory, **options)
    # @option (see #get_name)   
    # @!scope module
    def format_as_territory(context, value, **options)
      key = value.upcase
      get_name(context, value, **options) { |style| context.locale_data(:names, :territories, key, style) }
    end

    # Formats a string as a timezone, where the given string is the timezone's code.
    # @overload format(context, value, as: :timezone, **options)
    # @option (see Nii::Formattters::Nii::Timezone#format)
    # @!scope module
    def format_as_timezone(context, value, **options) = context.format

    # Formats a string as a script, where the given string is the script's code.
    # @overload format(context, value, as: :script, **options)
    # @option (see #get_name)
    # @!scope module
    def format_as_script(context, value, **options)
      key = value.capitalize
      get_name(context, value, **options) { |style| context.locale_data(:names, :scripts, key, style) }
    end

    # Formats a string as a unit, where the given string is the CLDR unit name.
    #
    # @overload format(context, value, as: :unit, **options)
    # @option (see #get_name)
    # @!scope module
    def format_as_unit(context, value, **options)
      key = value.downcase
      get_name(context, value, **options) do |style|
        style = :long if style == :default
        context.locale_data(:units, :units, key, style, :display_name)
      end
    end

    # Formats a string as a language variant, where the given string is the CLDR variant code.
    #
    # @overload format(context, value, as: :variant, **options)
    # @option (see #get_name)
    # @!scope module
    def format_as_variant(context, value, **options)
      key = value.downcase
      get_name(context, value, **options) { |style| context.locale_data(:names, :variants, key, style) }
    end

    private

    # @option options [String, Symbol] style (:default)
    #   Available styles are +default+, +short+, +narrow+, +long+, +menu+, and/or +variant+.
    #
    # @option options [String, nil] default (same as value)
    #   Fallback value if the script code is unknown.
    def get_name(context, value, **options)
      style    = (options[:style] || :default).to_sym
      result   = yield(style)
      result ||= yield(:default) if style != :default
      result ||= options.fetch(:default, value)
      result   = result.call if result.respond_to? :call
      result
    end
  end
end
