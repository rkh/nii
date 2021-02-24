# Getting Started, Part 2: The Context Object

At the heart of Nii is the context object. The intention is that you have one context object per unit of work, say a web request. It is the interface between your business logic and your localization logic.

``` ruby
require 'nii'

# our first context object - :en stands for English
context = Nii::Context.new :en

# let's format a number
context.format 1530 # => "1,530"

# In Standard German, commas and dots are used exactly reversed to how
# they are used in English.
Nii::Context.new(:de).format 1530 # => "1.530"

# We do generally claim we use Arab numerals, but we do write them
# a bit different from how they are written in Arabic.
# This is why Nii and the CLDR refer to the numerals we use in English
# and other languages in Latin script as Latin numerals instead.
Nii::Context.new(:ar).format 1530 # => "١٬٥٣٠"

# Chinese languages default to Latin numerals, but we can tell Nii to use
# a locale's traditional numbering system instead:
Nii::Context.new(:zh, numbering_system: :traditional).format 1530
# => "一千五百三十"

# You can also change the numbering system for an individual number.
# Make sure you don't confuse Roman numerals with Latin numerals:
Nii::Context.new.format 1530, numbering_system: :roman
# => "MDXXX"
```

## Creating a Context

You may have noticed that the last context didn't have a language code.

The language codes we passed to `new` don't tell Nii to create a context for the given language. Rather, they say "I want a context, and I'd prefer it to be in language X". Nii will then decide what locale to actually pick based on the configuration (and available message templates).

A context is created from the following arguments:
* A list of locale preferences (these can be locale codes, but it also accepts valid HTTP [Accept-Language](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Accept-Language) headers).
* A list of configuration options.

If you create multiple context instances with the same configurations and locale preferences, they will behave the same. Therefore, if you do need to persist or pass around context information, all you need to store is the locale code. If you want a user to be able to configure their locale, you can store the code in a database model. If you have a background job to send out emails, store the locale code with the payload, etc.

As mentioned before, a locale is way more than just the language. We'll take a closer look in the next part, and then come back to our context objects to take a closer look at the configuration.

## Further Reading
* **Next Chapter: [Part 3: Locales](03-locales.md)**
