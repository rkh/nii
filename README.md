<!-- This file has been generated. Source: src/README.md.erb -->

# Nii

[![Test](https://github.com/rkh/nii/actions/workflows/ci.yml/badge.svg)](https://github.com/rkh/nii/actions/workflows/ci.yml)

Nii is an **internationalization** (i18n) and **localization** (l10n) solution for Ruby. It is **modular**, **comprehensive**, **fast**, and built on top of **modern standards** and best practices.

With Nii, you can **[manage translations](#translation-management)**, **[localize any Ruby object](#object-localization)**, all with an easy to use, powerful **[configuration setup](#advanced-setups)**. It includes out of the box support for **[233 languages](docs/languages.md)**, with **1531 language variants**.

## Translation Management

Nii manages your application's translated content.
Similar solutions include [Ruby I18n](https://github.com/ruby-i18n/i18n), [R18n](https://github.com/r18n/r18n), [gettext](https://ruby-gettext.github.io/), and [FastGettext](https://github.com/grosser/fast_gettext).

### Example

`locales/en/example.ftl` (localization for [English](docs/languages/en.md), using [Fluent](docs/formats/fluent.md)):

``` fluent
hello-world = Hello World!

greeting =
  { NOW() -> 
    [morning]   Good morning, {$name}!
    [afternoon] Good afternoon, {$name}!
    [night]     Good night, {$name}!
   *[other]     Good day to you!
  }
```

`example.rb`:

``` ruby
# Load translations from "locales" directory
config = Nii["locales", namespace: :example]

# Create a new context for Englisch
context = Nii::Context.new(:en, config)
context.render "hello-world"                # => "Hello World!"
context.render :greeting, { name: "Maria" } # => "Good morning, Maria!" (depending on time of day)
```

### Notable Features

* Load translations from the local file system. Supports a range of directory structures and naming conventions.
* Load translations from an inline definition.
* [Load translations from a database](nii-sql). A wide range of databases is supported.
  Nii can also reuse an existing Active Record or Sequel connection or connection pool.
* Load translations from multiple sources.
* Translations are grouped in namespaces for content isolation.
* Support for reusable terms and translation attributes.
* Load translations from a custom backend.
* Support for a wide variety of [file formats](docs/formats.md), including [Fluent](docs/formats/fluent.md),
  [Gettext](docs/formats/gettext.md), [YAML](docs/formats/yaml.md),
  [JSON](docs/formats/json.md), [TOML](docs/formats/toml.md), [XLIFF](docs/formats/xliff.md),
  [Java/Mozilla properties files](docs/formats/properties.md) and more.
* Ability to convert between file formats. Useful if developers work with different formats than translators, or to import translations.
* Automatically load new translations and reload updated translations in development mode. It will only reload updated files.
* Advanced support for various [grammatical rules](docs/grammar.md), including plural categories (cardinal/ordinal/ranges,
  full support for all CLDR conditions), cases, genders, definiteness, T-V distinction (formal vs informal pronouns).
* Directly load translations from Ruby I18n or R18n into Nii.
* Use Nii as a [backend for Ruby I18n](nii-i18n).
* Built-in support for [HTML formatting](docs/html.md), sanitizing, and escaping (compatible with Active Support).
* Support for positional and named arguments, which can be provided ad hoc and/or predefined.
* Comes with a library of [template functions](docs/functions.md) for more flexible translations.
* Script and directionality aware string constructions, with automatic support support for bidirectional text, with embedded UTF-8 markers or HTML tags.
* Differentiates between language inheritance and fallbacks, to avoid mixed language content.

## Object Localization

Nii converts various Ruby objects into human readable, well formatted, localized strings. Similar solutions include [TwitterCldr](https://github.com/twitter/twitter-cldr-rb) and [Active Support](https://guides.rubyonrails.org/active_support_core_extensions.html).

### Example

``` ruby
# Create a context for English
nii = Nii::Context.new "en" # => #<Nii::Context:en-US>

# Formatting various objects
nii.format 9.99, style: :currency            # => "$9.99"
nii.format Nii::Territory["US"]              # => "United States"
nii.format ["de", "fr", "it"], as: :language # => "German, French, and Italian"

# Spelling out numbers (and other objects)
nii.spellout 2020                 # => "two thousand twenty"
nii.spellout 2020, rule: :year    # => "twenty twenty"
nii.spellout 115,  rule: :ordinal # => "one hundred fifteenth"

# Proper HTML interpolation
values = ["<foo>", "<bar>"]
result = nii.format(values) { nii.html "<b>?</b>", _1 }
result            # => "<b>&lt;foo&gt;</b> and <b>&lt;bar&gt;</b>"
result.html_safe? # => true

# Using RubyMoney
require "money"
price = Money.eur 15_00
nii.format   price # => "€15.00"
nii.spellout price # => "fifteen euros"
```

### Notable Features

* Format numeric values with smart defaults and a high level of customizability.
  * Localized symbols, delimiters, and separators.
  * Localized delimiter and separator position (numbers in Indian English and other languages are formatted correctly).
  * Fine-grained control over precision, rounding, sign display, etc.
  * Support for Unicode style decimal formatting patterns (subset of Excel/Google decimal patterns).
  * Support for Unicode Rule Based Number Formats (RBNF).
  * Support for multiple formatting styles (default, decimal, currency, precent, or unit).
  * ECMAScript API compatibility (you can use the same formatting rules server-side that you use in your client-side JavaScript code).
  * Support for various numbering systems, including decimal systems (Latin, Arab, etc), and non-decimal systems (like Traditional Chinese Numerals).
    You can directly specify a different numbering system, or have Nii pick the appropriate default, native, traditional, or financial numbering system
    for the given locale.
* Format money objects, compatible with [RubyMoney](http://rubymoney.github.io/money/), [shopify-money](http://shopify.github.io/money/), custom Money classes, as well as directly from numeric values (if you provide a currency or style option).
  * Localized currency symbols and names (AS$ vs $).
  * Localized currency position and spacing rules.
  * Handles unknown currencies well (example: falls back to RubyMoney currency information for BTC, which is not included in the CLDR).
  * Ability to round to valid cash amount (for currencies that don't have a single cent/fraction coin or bill).
* Format Arrays as lists.
  * Support different styles (and/or/unit, each also as short or narrow).
  * Provide formatting options applied to all elements.
  * Dynamically format elements in the list (useful for injecting markup).
  * Support complex localization rules (languages like Spanish, Hebrew, and Luxembourgish use different words or spellings for "and" depending on the list elements).
  * Properly handle bidirectional content (for example, Arabic words listed in English).
* Format Hashes as localized key-value list.
* Built-in formatters for popular gems.
  * Active Support: Duration, TimeZone, TimeWithZone.
  * Concurrent Ruby: Array, Hash, Map, Set, Tuple.
  * TZinfo: Timezone, Timestamp, Country.
  * Nii: Calendar, Date, DayPeriod, Locale, NumberingSystem, Territory, Timezone, Timezone::Meta, Units (as part of nii-units).
  * RubyMoney, shopify-money.
* Format Date, Time, and DateTime.
  * Support alternative calendars (anything besides Gregorian requires nii-calendars gem).
  * Determine localized day period ("afternoon" has a different meaning based on language and location).
* Format strings and symbols.
  * Turn identifiers into localized names for calendar systems, collation algorithms, currencies, day periods, keys, languages, measurement systems,
    countries and territories, scripts, units, and variants.
  * Format strings as if they were numbers.
* Spell out numbers and money objects as words and phrases.
  * Supports multiple spelling rules per language to handle cardinal and ordinal numbers, as well as cases, genders and other grammatical aspects.
* Partially format and re-format values (useful for setting default formatting rules for variable passed to dynamic translations).
* Add custom formatters for your own Ruby objects.

## Content Negotiation

… *todo* …

### Example

… *todo* …

### Notable Features

… *todo* …

## Advanced Setups

… *todo* …

### Example

… *todo* …

### Notable Features

… *todo* …

## Modern Internals

… *todo* …


## License

Nii is licensed under an [MIT License](LICENSE).
It also includes modified versions of the CLDR data files, which are licensed under a [Unicode license](nii-core/data/LICENSE).
