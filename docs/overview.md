<!-- This file has been generated. Source: src/docs/overview.md.erb -->

# Overview

Nii is an **internationalization** (i18n) and **localization** (l10n) solution for Ruby. It is **modular**, **comprehensive**, **fast**, and built on top of **modern standards** and best practices.

With Nii, you can **[manage translations](#translation-management)**, **[localize any Ruby object](#object-localization)**, all with an easy to use, powerful **[configuration setup](#advanced-setups)**. It includes out of the box support for **[233 languages](languages.md)**, with **1531 language variants**.

## Translation Management

Nii manages your application's translated contend.
Similar solutions include [Ruby I18n](https://github.com/ruby-i18n/i18n), [R18n](https://github.com/r18n/r18n), [gettext](https://ruby-gettext.github.io/), and [FastGettext](https://github.com/grosser/fast_gettext).

### Example

`locales/en/example.ftl` (localizaiton for [English](languages/en.md), using [Fluent](formats/fluent.md)):

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

… *todo* …

## Object Localization

… *todo* … Similar solutions include [TwitterCldr](https://github.com/twitter/twitter-cldr-rb) and [Active Support](https://guides.rubyonrails.org/active_support_core_extensions.html).

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

… *todo* …

### Notable Features

… *todo* …

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

