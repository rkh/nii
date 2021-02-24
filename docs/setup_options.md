<!-- This file is generated from source code comments. -->

# Setup Options

## Overview

 Option                                       | Summary
----------------------------------------------|----------------------------------------
 [`auto_fallbacks`](#auto_fallbacks)          | Lets Nii dynamically determine the fallback locale based on user preferences.
 [`available_locales`](#available_locales)    | Limits the locales that are acceptable outcomes for locale negotiation.
 [`data`](#data)                              | Allows replacing the backend for loading CLDR data.
 [`data_locale`](#data_locale)                | Overrides the locale ID used for looking up CLDR data.
 [`default_namespace`](#default_namespace)    | Alias for namespace.
 [`domain`](#domain)                          | Allows for domain specific setup.
 [`encoding`](#encoding)                      | Sets the encoding used for formatting strings.
 [`env_key`](#env_key)                        | The Rack environment key to store the context instance under.
 [`fallback_locale`](#fallback_locale)        | Alias for fallback_locales.
 [`fallback_locales`](#fallback_locales)      | Defines a fallback locale.
 [`filter_fallbacks`](#filter_fallbacks)      | This option will cause fallbacks to be filtered based on user preference.
 [`ignore_path`](#ignore_path)                | Alias for ignore_paths.
 [`ignore_paths`](#ignore_paths)              | Tells Nii to not handle requests to a given path.
 [`insert_after`](#insert_after)              | Sets insertion point for middleware before a certain other middleware.
 [`insert_before`](#insert_before)            | Sets insertion point for middleware after a certain other middleware.
 [`language_header`](#language_header)        | Sets or enables/disables the HTTP request header to use for locale negotiation.
 [`locale`](#locale)                          | Sets a fixed locale, skipping any locale negotiation.
 [`locale_path`](#locale_path)                | If enabled, Nii::Middleware will parse the locale from the given path.
 [`locales`](#locales)                        | Alias for available_locales.
 [`measurement_system`](#measurement_system)  | Overrides the measurement system.
 [`namespace`](#namespace)                    | Sets the default namespace to be used for `find_message` (and thus `render`).
 [`numbering_system`](#numbering_system)      | The default numbering system to use for formatting numbers.
 [`numbers`](#numbers)                        | Alias for numbering_system.
 [`on`](#on)                                  | Create a new locale dependent scope.
 [`pattern_style`](#pattern_style)            | Enables pattern matching for domain, locale_path, and ignore_path.
 [`reload_templates`](#reload_templates)      | Enables automatic message template reloading whenever localization files change.
 [`rounding_mode`](#rounding_mode)            | The rounding mode to be used when formatting numbers.
 [`setup`](#setup)                            | Applies the current setup to another application.
 [`sync_key`](#sync_key)                      | The Rack environment key to store the synchronization context under.
 [`territory`](#territory)                    | Overrides the territory.
 [`timezone`](#timezone)                      | Overrides the timezone.
 [`timezone_cookie`](#timezone_cookie)        | Sets or enables/disables the use of a timezone cookie.
 [`timezone_header`](#timezone_header)        | Sets or enables/disables the HTTP request header to use for timezone determination.


## Scopes

 Scope          | Gem            | Description 
----------------|----------------|--------------------------------
 Vanilla        | nii-core       | Setup scope when setup is invoked without an application argument.
 Locale         | nii-core       | Setup scope inside an `on` block.
 Domain         | nii-core       | Setup scope inside a `domain` setup block.
 Middleware     | nii-core       | Setup scope for Nii::Middleware.
 Global         | nii-global     | Setup scope for Nii::Global and other Nii::Shared instances.
 I18n           | nii-i18n       | Setup scope for Ruby I18n.
 Rails          | nii-rails      | Setup scope for Rails applications and engines.
 Sinatra        | nii-sinatra    | Setup scope for Sinatra applications.

## Details

### `auto_fallbacks`
**Scope: Vanilla, Locale, Domain, Middleware, Global, I18n, Rails, Sinatra**

Lets Nii dynamically determine the fallback locale based on user preferences.

If this is enabled, the client's locale preference, which is typically based on the
Accept-Language header for web applications, is used not only to determine the best
locale to use, but also its fallback locale.

Ruby I18m gives us a few examples in their documentation:
> "People speaking Arabian as spoken in Palestine also speak Hebrew as spoken in Israel. […]
> People speaking Sami as spoken in Finland also speak Swedish and Finnish as spoken in Finland."
> – Ruby I18n fallback documentation

This setting lets you implement exactly this feature, but instead of making assumptions about
a user's language knowledge, it lets the user tell us what languages would be acceptable options.
This preference is most commonly configured via or determined by the operating system or web browser.
The user does not have to configure this for your application specifically.

We do not recommend making assumptions about the user's language knowledge, unless you have an extremely
high certainty (like setting Swiss Standard German as a fallback for Swiss German, or assuming your audience
speaks English when providing content for software developers).

``` ruby
setup = Nii::Setup.new do
  available_locales "en", "de", "fr"
  auto_fallbacks
end

# this part is automatically handled by Nii::Middleware
# and only used for illustration
accept_language = "gsw-CH, de-CH, fr-CH, en"
context         = Nii::Context.new(accept_language, setup)

# gsw-CH gets filtered out, as it isn't supported
context.locale           # => #<Nii::Locale:de-CH>
context.fallback_locales # => [#<Nii::Locale:fr-CH>, #<Nii::Locale:en>]
```

### `available_locales`
**Scope: Vanilla, Domain, Middleware, Global, I18n, Rails, Sinatra**

Limits the locales that are acceptable outcomes for locale negotiation.

Sub-locales will still be accepted (ie, if `en` is in the list of available locales,
a client may still ask for `en-US`). This option is ignored if a locale is set explicitly.

``` ruby
Nii::Setup.new do
  available_locales "de", "en"
end
```

### `data`
**Scope: Vanilla, Middleware, Global, I18n, Rails, Sinatra**

Allows replacing the backend for loading CLDR data.

Primarily for internal purposes, like testing.
May be useful in the future if the CLDR data should be upgraded/downgraded separately.

``` ruby
Nii::Setup.new do |config|
  config.data = Nii::Data.new "path/to/data"
end
```

### `data_locale`
**Scope: Locale**

Overrides the locale ID used for looking up CLDR data.

This setting will not impact message lookup, and may lead to unexpected
consequences if the messages are written in a different script than
correspond to the data locale (like when setting Arabic as the data locale
for English).

The most common use case is to support a custom locale identifier you invented
yourself. Though you might be better of using a variant instead (if you use
`en-pirate` instead of `pirate` Nii will automatically pick "en" as data locale).

``` ruby
setup = Nii::Setup.new do
  on(language: "en") { data_locale "fr" }
end

# Nii will now use "fr" to look up data in the CLDR
context = Nii::Context.new("en-US", setup)
context.format "US", as: :region # => "États-Unis"
```

### `default_namespace`
**Scope: Vanilla, Locale, Domain, Middleware, Global, I18n, Rails, Sinatra**

Alias for [`namespace`](#namespace).

### `domain`
**Scope: Middleware, Rails, Sinatra**

Allows for domain specific setup.
If patterns are used, multiple configurations may apply to a single domain (they are matched in definition order).

``` ruby
Nii::Setup.new MyApp do
  # applies to all .de domains
  domain(/\.de$/) { locale "de-DE" }

  # applies in addition to the block above
  domain("beispiel.de") { namespace "example" }
end
```

### `encoding`
**Scope: Vanilla, Locale, Domain, Middleware, Global, I18n, Rails, Sinatra**

Sets the encoding used for formatting strings.
It is recommended to only use Unicode based encodings, as many features (including bi-directional text and collation)
might not be available otherwise.

``` ruby
Nii::Setup.new MyApp do
  encoding "UTF-16"
end
```

### `env_key`
**Scope: Middleware**

The Rack environment key to store the context instance under.
Changing this setting allows you to have more than one context per request.

### `fallback_locale`
**Scope: Vanilla, Locale, Domain, Middleware, Global, I18n, Rails, Sinatra**

Alias for [`fallback_locales`](#fallback_locales).

### `fallback_locales`
**Scope: Vanilla, Locale, Domain, Middleware, Global, I18n, Rails, Sinatra**

Defines a fallback locale. It is used for message lookup if a message isn't defined for the current locale.

This is different from inheritance: `fr-Latn-CH` will automatically inherit messages from `fr-CH`,
`fr-Latn`, and `fr`.

This option can be used to immitade Ruby I18n's `fallback` and `default_locale` settings.
It is very flexible in combination with `on`, `setup`, and `domain`.

``` ruby
Nii::Setup.new do
  # set fallback for all locales to American English
  fallback_locale "en-US"

  # set fallback locale for Norwegian Nynorsk
  # to Norwegian Bokmål and EU English
  on language: "nn" do
    fallback_locales "nb", "en-150"
  end
end
```

### `filter_fallbacks`
**Scope: Vanilla, Locale, Domain, Middleware, Global, I18n, Rails, Sinatra**

This option will cause fallbacks to be filtered based on user preference.

It is similar to {#auto_fallbacks}, but will only choose fallbacks from the pre-defined
fallback locales, and also maintain the configuration order.

### `ignore_path`
**Scope: Domain, Middleware, Rails, Sinatra**

Alias for [`ignore_paths`](#ignore_paths).

### `ignore_paths`
**Scope: Domain, Middleware, Rails, Sinatra**

Tells Nii to not handle requests to a given path.

Requests for these paths are exempt form features like locale_path, and also will not trigger locale negotiation.
Calling this method multiple times will add paths to the list, rather than override previous values.

``` ruby
Nii::Setup.new MyApp do
  ignore_paths "/application.css", "/application.js"
end
```

### `insert_after`
**Scope: Middleware**

Sets insertion point for middleware before a certain other middleware.
Useful to make sure the Nii context is created before some other logic is triggered,
that might depend on localization being available.

By default the specific framework implementation will determine the best place
to insert the middleware.

### `insert_before`
**Scope: Middleware**

Sets insertion point for middleware after a certain other middleware.
Useful to make sure the Nii context is created after some other logic is triggered,
that might be required to properly determine the locale.

By default the specific framework implementation will determine the best place
to insert the middleware.

### `language_header`
**Scope: Middleware, Rails, Sinatra**

Sets or enables/disables the HTTP request header to use for locale negotiation.

* false: disable header based locale negotiation.
* true or no value: enable header based locale negotiation with the default header (Accept-Language)
* A String: use an alternative header.

Note that other locale determining settings (like locale_path or a fixed locale)
take precedence over the header value.

``` ruby
Nii::Setup.new MyAPI do
  # use the non-standard X-Language header instead
  language_header "X-Language"
end
```

### `locale`
**Scope: Domain**

Sets a fixed locale, skipping any locale negotiation.
Useful if locales are solely determined by domain.

``` ruby
Nii::Setup.new MyApp do
  domain("example.com") { locale "en-US" }
  domain("beispiel.de") { locale "de-DE" }
end
```

### `locale_path`
**Scope: Domain, Middleware, Rails, Sinatra**

If enabled, Nii::Middleware will parse the locale from the given path.
If {#available_locales} are defined, it will only accept these values as valid path segments.

``` ruby
Nii::Setup.new MyApp do
  # Requests to "/en/home" will be translated to "/home" with locale set to "en"
  # Requests to "/" will redirect to "/en/" or "/de/" based on the user's language setting.
  available_locales "de", "en"
  locale_path

  # disable locale path for beispiel.de and set locale to "de"
  domain "beispiel.de" do
    locale_path false
    locale "de"
  end
end
```

### `locales`
**Scope: Vanilla, Domain, Middleware, Global, I18n, Rails, Sinatra**

Alias for [`available_locales`](#available_locales).

### `measurement_system`
**Scope: Vanilla, Locale, Domain, Middleware, Global, I18n, Rails, Sinatra**

Overrides the measurement system. Valid values are `US`, `UK`, and `metric`.

``` ruby
Nii::Setup.new do
  on(territory: 'GB') { measurement_system "metric" }
end
```

### `namespace`
**Scope: Vanilla, Locale, Domain, Middleware, Global, I18n, Rails, Sinatra**

Sets the default namespace to be used for `find_message` (and thus `render`).

``` ruby
Nii::Setup.new MyApp do
  domain "www.my-page.com" do
    namespace "web"
  end

  domain "admin.my-page.com" do
    namespace "web/admin"
  end
end
```

### `numbering_system`
**Scope: Vanilla, Locale, Domain, Middleware, Global, I18n, Rails, Sinatra**

The default numbering system to use for formatting numbers.

This can be set to a numbering system identifier (like `latn` or `arab`),
or one of the placeholder names `default`, `native`, `traditional`, and `finance`,
in which case Nii will pick the most appropriate numbering system for each locale.

``` ruby
Nii::Setup.new do
  # enable traditional numbers for languages that support it (like Chinese)
  numbering_system "traditional"

  on "la" do
    # use Roman numerals for Latin
    numbering_system "roman"
  end
end
```

### `numbers`
**Scope: Vanilla, Locale, Domain, Middleware, Global, I18n, Rails, Sinatra**

Alias for [`numbering_system`](#numbering_system).

### `on`
**Scope: Vanilla, Locale, Middleware, Global, I18n, Rails, Sinatra**

Create a new locale dependent scope.

``` ruby
Nii::Setup.new do
  # you can pass locale identifiers
  on "de-CH", "de-AT" do
    # have Swiss Standard German and Austrian German
    # fall back to Standard German
    fallback_locale "de-DE"
  end

  # you can pass a hash with conditions
  on territory: "US" do
    currency "USD"
  end

  # you can also combine the two
  on "en", "es", territory: "US" do
    measurement_system "US"
  end

  # these can also be nested
  on "de" do
    # default to EUR for everything in German
    currency "EUR"
    # except in Switzerland
    on(territory: "CH") { currency "CHF" }
  end
end
```

### `pattern_style`
**Scope: Middleware, Rails, Sinatra**

Enables pattern matching for domain, locale_path, and ignore_path.
Valid options include String, Regexp, as well as Mustermann pattern classes.

The class set as argument needs to implement `===` (returning true or false) and
`match` (returning a MatchData object).

``` ruby
# Rails compatible route patterns
require "mustermann/rails"
Nii::Setup.new MyRailsApp do
  pattern_style Mustermann::Rails
  locale_path "/l/:locale/*path" # use /l/en instead of /en as locale prefix
  ignore_path "/assets/*path"    # ignore all requests to /assets/*
end

# Sinatra compatible route patterns
require "mustermann/sinatra"
Nii::Setup.new MySinatraApp do
  pattern_style Mustermann::Sinatra
  domain("*.de") { locale "de-DE" } # pattern_style also applies to domain
end
```

### `reload_templates`
**Scope: Vanilla, Locale, Domain, Middleware, Global, I18n, Rails, Sinatra**

Enables automatic message template reloading whenever localization files change.
Framework integrations like nii-rails and nii-sinatra will typically set this
option for you in development mode.

``` ruby
Nii::Setup.new do
  reload_templates if ENV["RACK_ENV"] == "development"
end
```

### `rounding_mode`
**Scope: Vanilla, Locale, Domain, Middleware, Global, I18n, Rails, Sinatra**

The rounding mode to be used when formatting numbers.

Available modes:

* `halfeven` - Values exactly on the 0.5 (half) mark are rounded to the nearest even digit.
  This is often called Banker’s Rounding because it is, on average, free of bias.
  It is the default mode specified for IEEE 754 floating point operations, as well as the default used by Unicode/ICU.
* `halfodd` – Similar to `halfeven`, but rounds ties to the nearest odd number instead of even number.
* `halfdown` – Values exactly on the 0.5 (half) mark are rounded down (next smaller absolute value, towards zero).
* `halfup` – Values exactly on the 0.5 (half) mark are rounded up (next larger absolute value, away from zero).
* `down` – All values are rounded towards the next smaller absolute value (rounded towards zero). This is similar to Ruby's `to_i`.
* `up` – All values are rounded towards the next greater absolute value (away from zero).
* `halfceiling` – Values exactly on the 0.5 (half) mark are rounded toward positive infinity (+∞). This is the same as Ruby's `round` method.
* `halffloor` – Values exactly on the 0.5 (half) mark are rounded towards negative infinity (-∞).
* `ceiling` – All values are rounded towards positive infinity (+∞). This is the same as Ruby's `ceil` method.
* `floor` - All values are rounded towards negative infinity (-∞). This is the same as Ruby's `floor` method.
* `unnecessary` - The mode “Unnecessary” doesn’t perform any rounding, but instead returns an error if the value cannot be represented exactly without rounding.

### `setup`
**Scope: Everywhere**

Applies the current setup to another application.
Optionally takes a block for per-application customization.

``` ruby
Nii::Setup.new MyApplication do
  setup I18n # also use this configuration as I18n backend.

  setup Nii::Middleware do
    # middleware specific congiguration
    insert_after Rack::Head
  end

  # this applies to all three (MyApplication, Nii::Middleware, and I18n)
  available_locales "en", "fr"
end
```

### `sync_key`
**Scope: Middleware**

The Rack environment key to store the synchronization context under.
Used for synchronizing I18n.locale with the request's locale.

### `territory`
**Scope: Vanilla, Locale, Domain, Middleware, Global, I18n, Rails, Sinatra**

Overrides the territory.

The territory is exposed via Context#territory and used to determine measurement system, calendar, currency, etc.

Setting this option will not impact message lookup – it therefore works similar to the region override Unicode extension, except that it is
set by the server instead of the client, and takes priority (it overrides the override).

``` ruby
Nii::Setup.new MyApp do
  domain("beispiel.de") { territory "DE" }
  domain("beispiel.ch") { territory "CH" }
end
```

### `timezone`
**Scope: Vanilla, Locale, Domain, Middleware, Global, I18n, Rails, Sinatra**

Overrides the timezone. Th timezone exposed via Context#timezone and used for date and time formatting.

``` ruby
Nii::Setup.new do
  domain("web.co.uk") { timezone "Europe/London" }
end
```

### `timezone_cookie`
**Scope: Middleware, Rails, Sinatra**

Sets or enables/disables the use of a timezone cookie.

* false: disable cookie based timezone determination.
* true or no value: enable cookie based timezone determination with the default cookie name (tz and browser_time_zone)
* A String: use an alternative cookie name.

Nii will not do anything server-site to set this cookie, but will happily use it to determine the timezone.
It is recommended to set this cookie via JavaScript.

The simplest way to determine the timezone in JavaScript is via ECMAScript Intl:

  var timezone = Intl.DateTimeFormat().resolvedOptions().timeZone;

``` ruby
Nii::Setup.new MyAPI do
  # tell Nii to ignore any timezone cookie
  timezone_cookie false
end
```

### `timezone_header`
**Scope: Middleware, Rails, Sinatra**

Sets or enables/disables the HTTP request header to use for timezone determination.

* false: disable header based timezone determination.
* true or no value: enable header based timezone determination with the default header (Timezone, Time-Zone, or TZ)
* A String: use an alternative header.

Note that browsers don't currently implement this feature, and the draft standard from 2011 hasn't gone
beyond the proposal stage.

``` ruby
Nii::Setup.new MyAPI do
  # use the X-Timezone header
  timezone_header "X-Timezone"
end
```
