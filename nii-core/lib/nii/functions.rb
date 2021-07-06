# frozen_string_literal: true

module Nii
  # Public instance methods defined on this class will be available in templates.
  #
  # Given the following Fluent message:
  #
  #   example-message = { NUMBER(42) }
  #
  # Rendering this message will invoke {Nii::Functions#number}.
  #
  # @example Adding functions globally
  #   module MyFunctions
  #     def example = "Example Function"
  #   end
  #
  #   # This will impact every part of your system that's using Nii.
  #   Nii::Functions.include MyFunctions
  #
  # @example Adding functions only for your context
  #   class MyFunctions < Nii::Functions
  #     def example = "Example Function"
  #   end
  #
  #   # Set the functions configuration option:
  #   Nii::Context.new(functions: MyFunctions)
  #
  #
  # @note Inside Fluent templates, function names are all caps.
  class Functions < BasicObject
    # @api internal
    def self.new(context)
      super().instance_eval do
        @context = context
        self
      end
    end

    # @api internal
    def self.has_function?(function)
      return false if ::BasicObject.public_method_defined? function
      public_method_defined? function
    end

    # Inserts BiDi markers for easier direction mixing.
    #
    #   example = Nii in Yiddish is { BIDI("ניי") }.
    #
    # @see Nii::Info::Text#bidi
    def bidi(...) = @context.text.bidi(...)

    # @todo Better support for different capitalization rules in various languages and scripts.
    # Capitalizes a string. Handy for section/page titles or first words of a sentence.
    #
    #   example = Welcome to { CAPITALIZE($title) }!
    #
    # @param value [String, #to_s]
    def capitalize(value) = ::Nii::Utils.string(value).capitalize

    # Explicitely formats the given value.
    #
    #   example = { FORMAT("de", as: "country") }
    #
    # @see Nii::Context#format
    def format(...) = @context.format(...)

    # Allows explicit HTML within the localized message.
    #
    #   example = Hello { HTML("<a href='?'>?</a>", $link, $name) }!
    #
    # @note Using this in any larger project (where the translator is not also the developer) is discouraged.
    def html(...) = @context.html(...)

    # Can be used to dynamically invoke another function.
    #
    #   example = { INVOKE("number", 5, numberingSystem: "roman") }
    #
    # @param function [String, Symbol] The function name (lower case).
    def invoke(function, ...)
      return __send__(function, ...) if ::Nii::Functions.has_function? function
      ::Kernel.raise ::Nii::Errors::UnknownFunction, "unknown function: #{function.inspect}"
    end

    # Formats a list ("X and Y").
    #
    # Only useful for languages that use different words or spellings for "and" or "or"
    # based on the words in the list, like Spanish or Hebrew.
    #
    #     # In Spanish, this will use "y" or "e" based on the value of $third.
    #     example = { LIST($first, $second, $third) }
    #
    # @see Nii::Formatters::Array#format
    def list(*arguments, **options) = format(arguments.flatten, **options)

    # The measurement system. Useful as a variant selector:
    #
    #   speed-question =
    #     How quickly does the car go from 0 to { MEASUREMENT_SYSTEM() ->
    #      *[metric] 100
    #       [US]     60
    #       [UK]     60
    #     }?
    #
    #   temperature-warning =
    #     Temperatures will drop { MEASUREMENT_SYSTEM("temperature") ->
    #      *[metric] below zero
    #       [US]     below freezing
    #     }!
    #
    # @param type [String, Symbol] +general+, +temperature+, or +paper_size+
    # @see Nii::Info::MeasurementSystem
    def measurement_system(type = :general) = @context.measurement_system(type)

    # Allows embedding of a message. Note that message formats that support invoking functions
    # also often have dedicated syntax for embedding other messages, and these should be
    # preferred.
    #
    # Reasons to still use the message function regardless include:
    # * The ability to embedd messages with a key that isn't a valid identifier for the current format
    #   (example including a Gettext or Ruby I18n message in Fluent, which does not allow spaces nor dots
    #   in message names).
    # * Pass options to the message call, like setting a default value or scope.
    # * Pull in messages from other namespaces and from the fallback locales.
    # * Dynamically decide which message to embed based on a variable.
    #
    # @note
    #   Be very careful with using this method, as it does break the message bundle isolation barrier
    #   and can make life harder for your translators.
    #
    # @see Nii::Context#render
    def message(...) = @context.render(...)

    # Can be used for explicit number formatting:
    #
    #    example = { NUMBER(5, numberingSystem: "roman") }
    #
    # @param value [Numeric, String] Either a number or a string that can be parsed as a number.
    # @option (see Nii::Formatters::Numeric#format)
    def number(value, **options) = @context.localize(::Nii::Parser.number(value), **options)

    # Convenience method for adjusting a number by an offset. Useful for plural category selection
    # where the base count needs to be adjusted.
    #
    #   example = Liked by {$friend} { OFFSET($likes, -1) ->
    #     [0]
    #     [one]   and one other person
    #    *[other] and {OFFSET($likes, -1)} others
    #   }
    def offset(first, second) = ::Nii::Parser.number(first) + ::Nii::Parser.number(second)

    # Formats a number as ordinal. Takes a rule option for fine-tuning:
    def ordinal(value, **options)
      value = ::Nii::Parser.number(value)
      @context.numbers.ordinal(value, **options)
    end

    # Spells out a number, unit, money amount, or similar.
    # Use the rule option for fine-tuning:
    #
    #   # "one hundred fifteen" for 115 in English
    #   a = { SPELLOUT($number) }
    #
    #   # "one hundred and fifteen" for 115 in English
    #   b = { SPELLOUT($number, rule: "verbose") }
    #
    #   # "one hundred and fifteenth" for 115 in English
    #   c = { SPELLOUT($number, rule: "ordinal-verbose") }
    #
    # Available rules depend on language.
    # @see Nii::Context#spellout
    def spellout(value, **options) = @context.spellout(value, **options)
    alias_method :spell_out, :spellout

    # The tone to use. Helpful for languages with a T-V distinction (which includes all Roman languages
    # and most Germanic languages with the notable exception of modern English).
    #
    # Very useful as a variant selector:
    #
    #   reset-password =
    #     Achtung! {TONE() ->
    #       [formal]   Sie müssen Ihr Passwort zurück setzen.
    #       [informal] Du musst dein Passwort zurück setzen.
    #      *[avoid]    Passwort muss zurück gesetzen werden.
    #     }
    #
    # @see Nii::Info::Grammar#formality
    def tone = @context.grammar.tone
  end
end
