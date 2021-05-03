## Introduction

In the following writeup we will compare the Rails standard internationalization and localization setup with what Nii has to offer.

A few things to keep in mind:

* With the **Rails standard** we are referring to using the **[Ruby I18n](https://github.com/ruby-i18n/i18n) gem** together with **[rails-i18n](http://rails-i18n.org/)** and **[Active Support](https://guides.rubyonrails.org/active_support_core_extensions.html)**, which is the "[Rails way](https://guides.rubyonrails.org/i18n.html)" to tackle i18n/l10n. This setup can also be used without Rails. For the rest of this writeup, we refer to this setup interchangeably as **Rails**, **I18n**, or **ActiveSupport**, depending on where most of the logic for a specific feature is implemented.
* The purpose of this writeup is to give you some insight into the **motivation for creating and using Nii**, when there has been a well established solution in Ruby for more than a decade. It is not meant to discredit Rails or I18n in any way.
* You can **combine Ruby I18n and Nii** in your Rails or Ruby project without any downsides, they live happily next to each other.
* This writeup isn't exhaustive. It is also not meant as a bug list for Rails (and thus obvious bugs aren't included), but only uses feature differences based on the scope and/or internal design.

## Different Scope

It also important to realize that Nii is tackling a wider range of internationalization topics, and is more comparable to using ICU and/or ECMA-402 together with a message localization tool, like Gettext or Fluent.

### Things only I18n Does

* Bulk message lookup, which turns an array of message keys into an array of messages.
* Messages values can be any Ruby object.
* "Deep interpolation", which interpolates strings nested in hashes.
* Cache formatted messages in Memcached or Redis.
* Use ActiveRecode to store message templates (database backend is planned for Nii).
* Support older Ruby versions.
* Already integrated into Rails, Devise, and other libraries by default.
* Translations for multiple languages in a single file.

### Things only Nii Does

* Formatting for all Ruby objects, not just dates and times.
* Spell out numbers as words. Use different number systems.
* Localization beyond message formatting: Timezones, units, currencies, etc.
* Fully automated formatting, partial formatting, custom variable formatting.
* Include Common Locale Data Repository (names, formatting rules, grammar data, and more).
* Locale negotiation (automatically figure out which language to use, which region to target, and so on).
* Multi-script and bidirectional content support.
* Per application, locale, domain, arbitrary scope configuration, with support for nested and related configurations.
* Proper HTML formatting and escaping.
* Message namespace isolation.
* Safe loading of translations by default.
* Performance optimized happy paths.

## State and Configuration

### Global and Shared State

### Configurability

## Localization Formats

Rails with I18n supports YAML, JSON, Ruby, and Gettext as formats for storing localizations.

The first three are great for developers, but usually terrible formats for dedicated translators to work with. Gettext is often seen as the opposite (great for translators to work with, but not a nice format for developers, at least for Ruby developers). YAML and Ruby also allow arbitrary code execution. This is even an integral part of Ruby I18n, as it is the only way to model more complex grammatical features.

Nii on the other hand support most [common formats](/formats), and recommends using [Fluent](/formats/fluent), a versatile formats that is great for both developers and translators to work with.

### Developer Friendliness

With the default settings, Rails does not support placing localization files in subdirectories.

Some work may be required to get Rails to automatically reload translations in development mode. Even then, it does not support adding new files or new locales without restarting the server.

Nii supports anything from simple to complex directory structures, and can reload files in development mode out of the box (including discovering new files, and doing a partial reload).

### Translator Friendliness

With I18n, all localizations share a single, global namespace. A translator cannot look at a single file or set of files and reason about it in isolation.
The concept of "deep merging" data is a core part of I18n, but in effect means that what I18n calls scopes is not a reliable isolation mechanism. As mentioned before, most of the file formats supported by I18n are also not particularly user friendly for translators.

Nii supports an unlimited number of namespaces, as well as private terms that a translator can structure and use how ever it fits them, in isolation from the rest of the system.

Moreover, Nii can run multiple, completely isolated setups in parallel within the same process, to allow complete isolation of one localization context from another.

## Complex Translations

### Pluralization

Its support for pluralization is limited. While CLDR plural categories are supported in principal, the implementation lacks multiple features from the CLDR specification (anything besides positive integers can't be properly categorized). Plural categories for ranges or collections of things are not supported, and plural categories for floating point numbers as well as negative numbers are often incorrect, even in English.

I18n can also only decide plural categories based on a single variable (which has to be named `count`), using two different variables independently within the same message is impossible.

With Nii, you can do this:

``` fluent
# Example: "You have four points and 1,500 coins"
summary =
  You have
  { $points ->
    [one] one point
   *[other] {SPELLOUT($points)} points }
  { $coins ->
    [0]
    [one] and 1 coin
   *[other] and {$coins} coins }.
```

And use it in Ruby with a simple call:

``` ruby
variables = { points: 4, coins: 1500 }
nii.t :summary, variables
```

With I18n, you'd have to do something like this:

``` yaml
summary:
  prefix: You have
  middle:
    one: one point
    other: "%{points} points"
  end:
    zero: ""
    one: and 1 coin
    other: "and %{coins} coins"
```

Which, to be honest, doesn't look any more complex than the Nii example above.

However, it shifts a lot of localization logic into our Ruby code:

``` ruby
require "humanize"
include ActiveSupport::NumberHelper

variables = { points: 4, coins: 1500 }
formatted = {
  points: variables[:points].humanize(locale: I18n.locale)),
  coins:  number_to_delimited(variables[:coins])
}

[
  I18n.t("summary.prefix"),
  I18n.t("summary.middle", count: variables[:points], **formatted),
  I18n.t("summary.end",    count: variables[:coins],  **formatted)
].join " "
```

### Dealing with HTML

Using I18n to generate HTML is messy.

The problem: Some HTML follows sentence structure. Imagine your writing a blog engine (I know, what a creative example) and you want to include a sentence like *"This post was written by `$author`."* where *`$author`* is replaced with the name of the author, presented as a link to the author's about page.

The problem is that you cannot assume the name of the author will be at the end of the sentence, and it needs to somehow be determined by the localization.

#### The Rails Way

This is the recommended way to do it in Rails. You name your message ID something that ends with `_html` so Rails knows it is safe.

``` yaml
by_line_html: This post was written by <a href="%{author_link}">%{author_name}</a>.
```

You then insert the two variables needed to build the link:

``` erb
<article>
  <%= @article.content %>
  <%= t :by_line_html,
    author_name: @article.author.name,
    author_link: author_path(@article.author) %>
</article>
```

Now this has several problems:

1. Your translator needs to know HTML.
2. You are mixing presentation logic with localizations. Imagine if you have to change the HTML, you will have to do so in all the translations.
3. While Rails does escape the inserted variables, it is easy to produce broken markup as an entire translation has to be valid HTML.
4. You cannot reuse the same message in a different context where no or different markup is needed.

#### The Nii Way

With Nii, you can separate out the formatting logic:

``` fluent
by-line = This post was written by {$author}.
```

You can pass a block right when rendering the message:

``` erb
<article>
  <%= @article.content %>
  <%= t('by_line', { author: @article.author }) { |a| link_to a.name, a } %>
</article>
```

Or you can set up a reusable formatter for the `author` variable:

``` erb
<% nii.format_variable :author do |author| %>
  <a href="<%= author_path(author) %>"><%= author.name %></a>
<% end %>

<article>
  <%= @article.content %>
  <%= t 'by-line', { author: @article.author } %>
</article>
```

This easy approach to use a callback for injecting markup into a localized structure really starts paying off for more complex situations,
like formatting a list of things (similar to Rails' `#to_sentence`, but more powerful and flexible):

``` erb
<%= l @article.authors do |author| %>
  <%= link_to(author.name, author) %>
<% end %>
```

## Rails is Anglo-Centric

Rails has great support for English, and the closer another language is to English, the better.
This is already obvious by everything defaulting to English, rather than an abstract "root" language as it does in Nii (and ICU).

### Grammar

Rails/I18n has no support for grammatical features missing from the English language, like cases, definiteness, genders, etc.
It is impossible to use plural categories without code injection from the localization data.

Rails supports ordinal plurals for English only (think "1st", "2nd", etc), but doesn't provide these as CLDR plural categories (which isn't too dramatic, as those are usually used to create cardinal number suffixes). The bigger issue is that it doesn't provide any tooling for other languages.

### Lists
Rails assumes lists in languages all follow the same structure as they do in English. 

Here are some example from the Unicode Standard formatted with ActiveSupport:

``` ruby
['agua', 'hielo'].to_sentence(locale: :es)
# => "agua y hielo" (✅ correct)

['tos', 'hipo'].to_sentence(locale: :es)
# => "tos y hipo" (❌ incorrect)

[1, 2].to_sentence(locale: :he)
# => "1 ו2" (❌ incorrect)
```

Whereas Nii uses the correct rules:

``` ruby
context = Nii::Context.new(:es)

context.format ['agua', 'hielo']
# => "agua y hielo" (✅ correct)

context.format ['tos', 'hipo']
# => "tos e hipo" (✅ correct)

Nii::Context.new(:he).format [1, 2]
# => ⁨⁨1⁩ ו- ⁨"2⁩⁩" (✅ correct)
```

Rails also doesn't support different list styles (think of lists using "or" instead of "and").

### Number Formatting

Rails assumes that all numbers are formatted as they are in Western English, and that all you have to do is swap out the delimiter and separator symbols.

Here is how both format the number `120700.5` in various locales:

 Locale     | Rails      | Nii        | Notes on Rails
------------|------------|------------|------------
 `en`       | 120,700.5  | 120,700.5  | ✅ Correct.
 `de`       | 120.700,5  | 120.700,5  | ✅ Correct.
 `ar`       | 120,700.5  | ١٢٠٬٧٠٠٫٥  | ❌ Wrong symbols.
 `hi`       | 120,700.5  | 1,20,700.5 | ❌ Wrong delimiter position.
 `bn`       | 120,700.5  | ১,২০,৭০০.৫  | ❌ Wrong delimiter position, wrong symbols.
 `ne`       | 120,700.5  | १,२०,७००.५  | ❌ Wrong delimiter position, wrong symbols.

The same applies to other number formatters, like currency or percentage formatting.

### Dates and Times

… todo …

#### Calendars

While most countries only use traditional calendar systems for holidays or religious purposes, countries like Afghanistan, Iran, Ethopia, Nepal, Saudi Arabia, Bangladesh, India, Israel, Taiwan, Thailand, North Korea, and Japan use different civil calendars instead or in addition to the Gregorian calendar.

I18n assumes all dates to be in the Julian or Gregorian calendar. There have been attempts to add multi-calendar support to I18n via [ruby-cldr](https://github.com/ruby-i18n/ruby-cldr), which in turn has been copied into Twitter CLDR. Unfortunately, this implementation also only supports the Julian or Gregorian calendar.

Nii comes fully equipped with the ability to convert between calendars (via the nii-calendars gem).

#### Periods of the Day

I18n happily uses "am" and "pm" designations in various languages, translating them to the local equivalents of "morning" and "afternoon". This assumption is just plain incorrect. While "one in the afternoon" is something that makes sense to an American, it doesn't to people in other parts of the world. Nii is aware of the periods a day is structured in based on language and region, as well as how these are used when stating the time.

#### Timezones

Rails expands [TZInfo](https://tzinfo.github.io/) to support more timezone names, so you can create nicer timezone selection boxes and such. This feature is currently (Rails 6.1/7.0) completely hardcoded to English, with no support of mapping to other languages.

Nii comes with a full solution for timezone localization.

## Locales

By default in Rails and I18n, a locale is a string identifier. Nothing more, nothing less. The great advantage is that you can use any arbitrary string you want (as long as it can also be converted into a symbol). However, this means that there is no semantic connection between "en" (English) and "en-US" (American English).

### Locale Parsing

I18n has optional, limited support for [BCP 47](https://tools.ietf.org/html/bcp47), the best practice for dealing with language tags.
In I18n this feature is called "fallbacks". This is a small subsection of what Nii calls fallbacks, and what Nii calls inheritance.

When enabled, I18n does that by repeatedly truncating a locale, either by dropping the last dash and everything after it ("simple" tag parsing), or by using the RFC 4646/4647 truncation algorithm.

Nii instead implements the Unicode Technical Standard 35 (and also implements RFC 5647 instead of the outdated RFC 4646).

Lets see what that means for `de-Latn-DE-1901-x-informal` – German written in Latin script, using the standard variety from Germany with the spelling reform from 1901 ("Alte Rechtschreibung"), with the private extension "informal":

<table>
  <thead>
    <tr>
      <th>I18n: Simple</th>
      <th>I18n: RFC 4646</th>
      <th>Nii</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        de-Latn-DE-1901-x-informal<br>
        de-Latn-DE-1901-x<br>
        de-Latn-DE-1901<br>
        de-Latn-DE<br>
        de-Latn<br>
        de
      </td>
      <td>
        de-Latn-DE-1901-x-informal<br>
        de-Latn-DE-1901<br>
        de-Latn-DE<br>
        de-Latn<br>
        de
      </td>
      <td>
        de-Latn-DE-1901-x-informal<br>
        de-Latn-DE-1901<br>
        de-Latn-DE-x-informal<br>
        de-Latn-DE<br>
        de-DE-1901-x-informal<br>
        de-DE-1901<br>
        de-DE-x-informal<br>
        de-DE<br>
        de-Latn-1901-x-informal<br>
        de-Latn-1901<br>
        de-Latn-x-informal<br>
        de-Latn<br>
        de-1901-x-informal<br>
        de-1901<br>
        de-x-informal<br>
        de
      </td>
    </tr>
  </tbody>
</table>

This means that in the given example, I18n would never pick up messages defined for `de-DE`, or `de-x-informal`, but Nii would.

For content negotiation this isn't as dramatic, as clients usually only specify a locale with language and region (`de-DE`), but Nii uses this mechanism to encode various localization aspects, and thus makes them easily exchangeable between parts of the system, including parts that use a different tool from Nii for localization (like ICU).

### Unknown Locales

The whole point above becomes mute for I18n when you realize that locales need to be exact matches from the list of available locales (or alternatively you need to disable any and all locale validation globally). Therefore you could never even set `de-Latn-DE-1901-x-informal` as locale, unless this precise permutation has been listed in your configuration or translations before.

To illustrate why this is an issue, imagine you have a setup for English (en), German (de), and French (fr). You have a user visit your website from Luxembourg. This user only speaks Luxembourgish, French, and German. The user's browser will therefore send an `Accept-Language` header like `lb-LU, fr-LU, de-LU`. These tags are all unknown to I18n, and it would therefore default to English.

In this scenario, the user speaks all but one of the language that you offer, but that one language is the one presented to them.

### Inheritance vs. Fallbacks vs. I18n

Nii differentiates between inheritance and fallbacks. Everything we have discussed so far would fall under inheritance for Nii.

#### Inheritance

Inheritance for Nii is based on the fallback chain above, but can also be done via locale matching (ie use `und-CH` to describe any locale with the region subtag `CH`, including `de-CH` and `fr-CH`).

There are three things that are inherited:
* Locale specific configuration options.
* Message templates.
* CLDR data.

So if you have a message like this defined for `de`:

``` fluent
example = Das Ergebnis ist {$result}.
```

Then `de-CH` will inherit this message template, but it will still be rendered with all the rules and settings for `de-CH`, and thus use Swiss rather than German number formatting (if `result` is a number).

This is very handy if you want to just override a segment of a message:

``` fluent
## @locale de
hospital = Krankenhaus
welcome-to-hospital = Willkommen im {hospital}!
```

`welcome-to-hospital` will be inherited by `de-CH`:

``` fluent
## @locale de-CH
hospital = Spital
```

And thus:

``` ruby
context = Nii::Context.new("de-DE", config)
context.render "welcome-to-hospital" # => "Willkommen im Krankenhaus!"

context = Nii::Context.new("de-CH", config)
context.render "welcome-to-hospital" # => "Willkommen im Spital!"
```

#### Fallbacks

Fallbacks are different. You can set up a fallback either globally, per locale, or completely dynamically. A common use case is to set English as the fallback.

Imagine that in the above example you have the same structure, and want to reuse the term *hospital*:

``` fluent
## @locale en
new-hospital = We're planning a new {hospital}!
```

Fallback logic is separated from inheritance logic, and it will only check the English message templates for an entry for `hospital`:

``` ruby
context = Nii::Context.new("de-DE", config)
context.render "welcome-to-hospital" # => "Willkommen im Krankenhaus!"
context.render "new-hospital" # => "We're planning a new hospital!"
```

#### Ruby I18n

In Ruby I18n, the result might be more in line with inheritance or with fallbacks, or something different all together, depending on how you tackle this problem.

Imagine you want to be able to override separate terms as above, and you do something like this:

``` yaml
terms:
  hospital: Krankenhaus

welcome_to_hospital: Willkommen im %{hospital}!
```

You could then implement something along the lines of:

``` ruby
I18n.locale = 'de-DE'
I18n.t(:welcome_to_hospital, I18n.t(:terms))
# => "Willkommen im Krankenhaus!"
```

Now using this same approach for a new message as outlined will result in broken English:

``` ruby
I18n.locale = 'de-DE'
I18n.t(:new_hospital, I18n.t(:terms))
# => "We're planning a new Krankenhaus!"
```

This problem also applies if you use Ruby templates or an interpolation plugin, as a message template isn't aware of its locale and would have to check `I18n.locale`.

This becomes even more of an issue if you use I18n as a per-locale data store (as Rails does):

``` yaml
en:
  consitent:
    key: value

  inconsistent:
    key:
      foo: on
    other: on

de:
  consistent:
    key: Wert
  
  inconsistent:
    key: off
```

Causing these results, that may in turn lead to unexpected behavior:

``` ruby
I18n.locale = :de

# this seems fine
I18n.t "consistent"     # => { :key => "Wert" }
I18n.t "consistent.key" # => "Wert"

# these values are contradictory
I18n.t "inconsistent.key"     # => false
I18n.t "inconsistent.key.foo" # => true

# these values are contradictory
I18n.t("inconsistent").include? :other # => false
I18n.t("inconsistent.other")           # => true
```

### Dynamic Fallbacks

## Internals

### Extendability

### Thread-Safety

### Performance
