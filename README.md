# Nii

[![Test](https://github.com/rkh/nii/actions/workflows/ci.yml/badge.svg)](https://github.com/rkh/nii/actions/workflows/ci.yml)

Nii is an **internationalization** (i18n) and **localization** (l10n) solution for Ruby.
It is **modular**, **comprehensive**, **fast**, and built on top of **modern standards** and best practices.

**You can learn more about Nii on the [official Website](https://nii.dev).**

## Quick Start

### Install Nii

If you use Bundler, add `nii` to your Gemfile and run `bundle install`. Otherwise run `gem install nii`.

### Create a Localization Directory

Now create a localization directory per language you want to support, like `locales/en` for English. You can place your localization files in here, if you already have them. Nii supports almost all the common formats, so if you have some from Ruby I18n, Gettext, i18next, etc. you can just place them there.

If not, you can create a new one. Lets add `locales/en/hello.ftl`:

``` ftl
hello-world = Hello World!

# Greeting someone.
#   $name (String) - Name of the person being greeted.
hello-user = Hello {$name}!
```

### Use it in Ruby

``` ruby
require "nii"

# Create a localization context for American English,
# with locale data from locales directory, set "hello" as the default namespace
context = Nii::Context.new "en-US", Nii["locales"], namespace: "hello"

# render "hello-world" from locales/en/hello.ftl
context.render "hello-world" # => "Hello World!"

# render "hello-user" from locales/en/hello.ftl
context[:name] = "Maria"
context.render "hello-user" # => "Hello Maria!"
```

## Dependencies

The core project has these mandatory dependencies:

* **Ruby 3.0** or a compatible implementation.
* **concurrent-ruby** – Installed automatically if you use RubyGems/Bundler.
* **tzinfo** – Installed automatically if you use RubyGems/Bundler.

You may also want to install one or more of the following optional dependencies:

* **concurrent-ruby-ext** – Will improve performance, as Nii makes heavy use of concurrent-ruby. This is always recommended if you use MRI/CRuby.
* **tzinfo-data** – If you work with timezones, this gem will ensure consistent behavior across setups.
* **tomlrb** – Recommended if you want to use [TOML files](https://toml.io/en/) for localizations. A use case would be to share localizations with [go-i18n](https://github.com/nicksnyder/go-i18n).

## Etymology

<!-- keep in sync with web/source/glossary/nii.html.md --->

The word "Nii" is:
* The name of a language spoken by between 10,000 and 25,000 people in the highlands of Papua New Guinea.
* An abbreviation for:
  * New Internationalization Implementation
  * Neue Internationalisierungsimplementierung
  * Nueva Implementación de Internacionalización
  * Ny Implementering av Internationalisering
  * <bdi>ניו ימפּלעמענטאַטיאָן פון ינטערנאַשאַנאַליזיישאַן</bdi> (as transliteration of <bdi>ניי</bdi>)
* A homophone of:
  * "no", "not", "never", or "neither" in Gothic (𐌽𐌹), German (nie), Dutch (nie), Afrikaans (nie), Alemannic (nie), Hunsrik (nie), Polish (nie), French (ni), Serbo-Croatian (ni/ни), Veps (ni), Old Church Slavonic (ни), Russian (ни), Bulgarian (ни), Irish (ní), Macedonian (ни), Ukrainian (ні), Cornish (ny).
  * "yes" in Kaurna (nii)
  * "this" in Nahuatl (ni), Malay (<bdi>ـني</bdi>), Vietnamese (ni).
  * "I" or "me" (first person singular) in Basque (ni), Unami (ni), Nivkh (ни), Maltese (-ni), Arabic (<bdi>ـني</bid>), Pitjantjatjara (-ṉi), Munsee (nii)Dura (ङि), Ewe (nye).
  * "we", "us" or "our" in Breton (ni), Esperanto (ni), Romanian (ni), Sicilian (ni), Bulgarian (ни), Karelian (-ni), Old Irish (-ni), Quechua (-ni), Welsh (ni), Afar (ni), Akkadian (𒉌).
  * "he", "she", or "they" in Ndrumbea (ni), Tsakonian (νι).
  * "you" or "your" in Abinomn (ni), Swedish (ni), Swahili (-ni), Chinese (as in 你好 - "nii hao", a greeting), Dungan (ни), Korean (니).
  * 贄 – "gift" or "offering to the gods" in Japanese.
  * "two" in Antong (নি), Rawang (ní).
  * Lower German for "new".
  * Zulu for "what" (-ni).
  * The thing the knights say.

## Repository Structure

For the time being, all Nii libraries and assets are managed in a mono repository containing the following:

* The Nii Ruby libraries:
  * [`nii`](nii) – Meta gem for nii-core, nii-units, nii-calendar, and nii-xml.
  * [`nii-core`](nii-core) – The main library.
  * [`nii-calendars`](nii-calendars) – Support for calendar systems beyond Gregorian that are included in the CLDR.
  * [`nii-extra-locales`](nii-extra-locales) – Data for less common locales (locales not designated "modern" by the Unicode Consortium).
  * [`nii-global`](nii-global) – A global/thread state implementation for Nii to offer an API similar to Ruby I18n.
  * [`nii-historic`](nii-historic) – Historical calendar system support.
  * [`nii-i18n`](nii-i18n) – Use Nii as a backend for Ruby I18n and/or synchronize state between I18n and a Nii context.
  * [`nii-rails`](nii-rails) – Framework integration for Rails.
  * [`nii-rbnf`](nii-rbnf) – Implementation for Unicode Rule Based Number Formats. Can be used standalone.
  * [`nii-sinatra`](nii-sinatra) – Framework integration for Sinatra.
  * [`nii-units`](nii-units) – Support for scientific units, based on CLDR data. Can be used standalone.
  * [`nii-xml`](nii-xml) – Adds support for XML-based localization formats, including XLIFF.

* Tooling:
  * `benchmark` – Benchmarking Ruby's various i18n solutions.
    * [`result.txt`](benchmark/result.txt) – Latest results.
    * `run.rb` – Executes the benchmarks.
  * `docs` – Various documentation files. Might all move to `web` in the future.
  * `rakelib` – Rake tasks
    * `cldr.rake` (`rake cldr`) – updates CLDR data.
    * `test.rake` (`rake` or `rake test`) – runs tests for all libraries.
    * `units.rake` (`rake units`) – regenerates files for nii-units.
    * `web.rake` (`rake web`) – updates data files used for the website.
  * `tools` – Shared development logic (test helpers, import logic, etc).
  * `vendor` – Imported data sources (mostly CLDR).
  * `web` – Source code for the official website. Uses [Middleman](https://middlemanapp.com/).

If you run certain Rake tasks locally, the following directories will also be generated:
  * `data` – decompressed and pretty versions of the data files, for inspection (generated by running `rake cldr`).
  * `coverage` – test coverage data (generated by running `rake test`).

### Git Dependencies with Bundler

To install the Git version as a dependency with Bundler, you can use the following approach:

``` ruby
source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

github "rkh/nii" do
  gem "nii"
  gen "nii-rails" # or whichever other integration you want
end
```

## License

Nii is licensed under an [MIT License](LICENSE).
It also includes modified versions of the CLDR data files, which are licensed under a [Unicode license](nii-core/data/LICENSE).
