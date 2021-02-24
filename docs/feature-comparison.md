# Feature Comparison of I18n/L10n solutions for Ruby

Where possible, compliance and partial/full support is in comparison to the appropriate standard (usually CLDR/IC/IETF BCP).
Non-exhaustive list of features.

Take with a grain of salt, as this is obviously full of bias. There are probably also a lot of features you won't need in your application (though which these are might differ).

## Feature Overview

 Feature Category                | Nii               | Ruby I18n             | Twitter CLDR        | R18n               | Ruby gettext      | FastGettext
---------------------------------|-------------------|-----------------------|---------------------|--------------------|-------------------|------------
 [Pluralization](#pluralization) | ✅ compliant      | 🚧 partial support     | ✅ mostly compliant | 🚧 partial support | 🚧 partial support | 🚧 partial support
 [Reloading](#reloading)         | ✅ advanced       | 🚧 partial support     | 🚫 out of scope     | ✅ explicit reload | ❌ not supported   | ✅ explicit reload 

## Included Data

FastGettext has been excluded from this section, as it does not include any locale data.

 Data                             | Nii               | Ruby I18n       | Twitter CLDR        | R18n               | Ruby gettext
----------------------------------|-------------------|-----------------|---------------------|--------------------|----------------
 Locales included in main library | 700               | –               | 96                  | 37                 | 26
 Additional locales in add-on     | 830               | 111             | –                   | –                  | –
 Size (with locale data)          | 9.8 MB            | 1.8 MB          | 129 MB              | 472 KB             | 6.1 MB

These numbers are a snapshot and not updated regularly, and are meant more for a general indication. If a library has an essential dependency for providing data, then that dependency is included (ie, Nii includes `nii-core`, and not just the size of the `nii` gem).

Data add-ons taken into account:
* Nii: nii-extra-locales
* Ruby I18n: rails-i18n

## Supported File Formats

Twitter CLDR has been excluded, as this entire feature set is out of scope for them.

 Format                          | Nii                      | Ruby I18n             | R18n                | Ruby gettext       | FastGettext
---------------------------------|--------------------------|-----------------------|---------------------|--------------------|-------------------
 Recommended format              | Fluent                   | YAML                  | YAML                | po                 | mo
 YAML files                      | ✅ multiple formats      | ✅ custom format       | ✅ custom format    | ❌ not supported   | ✅ custom format
 JSON files                      | ✅ multiple formats      | ✅ custom format       | ❌ not supported    | ❌ not supported   | ❌ not supported
 Ruby files                      | ✅ Ruby I18n compatible  | ✅ custom format       | ❌ not supported    | ❌ not supported   | ❌ not supported
 Project Fluent (Mozilla)        | ✅ fully compliant       | ❌ not supported       | ❌ not supported    | ❌ not supported   | ❌ not supported
 Gettext (po files)              | ✅ supported             | ✅ supported           | ❌ not supported    | ✅ supported       | ✅ supported
 Gettext (mo files)              | ❌ not supported         | ❌ not supported       | ❌ not supported    | ✅ supported       | ✅ supported
 Property Files (Mozilla/Java)   | ✅ supported             | ❌ not supported       | ❌ not supported    | ❌ not supported   | ❌ not supported
 Plain Text                      | ✅ supported             | ❌ not supported       | ❌ not supported    | ❌ not supported   | ❌ not supported
 Property Files (Mozilla/Java)   | ✅ supported             | ❌ not supported       | ❌ not supported    | ❌ not supported   | ❌ not supported
 XLIFF (OASIS/ISO Standard)      | ⏳ coming soon           | ❌ not supported       | ❌ not supported    | ❌ not supported   | ❌ not supported
 TMX (LISA Standard)             | ⏳ coming soon           | ❌ not supported       | ❌ not supported    | ❌ not supported   | ❌ not supported

## Reloading

Twitter CLDR has been excluded, as this entire feature set is out of scope for them.

 Feature Category                | Nii | Ruby I18n | R18n | Ruby gettext | FastGettext
---------------------------------|-----|-----------|------|--------------|------------
 Explicitly trigger reload       | ✅  | ✅         | ✅   | ❌           | ✅
 Load new files on reload        | ✅  | ❌         | ✅   | ❌           | ✅
 Automatically detect changes    | ✅  | ❌         | ❌   | ❌           |  ❌
 Partial reload                  | ✅  | ❌         | ❌   | ❌           |  ❌

## Interpolation


## Number Formatting

 Feature                               | Nii           | Ruby I18n             | Twitter CLDR     | R18n               | Ruby gettext      | FastGettext
---------------------------------------|---------------|-----------------------|------------------|--------------------|-------------------|-------------
 Locale-based number formatting        | ✅ built-in   | 🚧 via ActiveSupport   | ✅ built-in      | ✅ built-in        | ❌ not supported   | ❌ not supported
 Rule Based Number Formatting          | ✅ built-in   | ❌ not supported       | ✅ built-in      | ❌ not supported   | ❌ not supported   | ❌ not supported

## Pluralization

 Feature                              | Nii           | Ruby I18n             | Twitter CLDR     | R18n                  | Ruby gettext      | FastGettext
--------------------------------------|---------------|-----------------------|------------------|-----------------------|-------------------|--------------
 Plural categories in messages        | ✅ built-in   | ✅ built-in            | 🚫 out of scope  | ✅ built-in            | ✅ built-in       | ✅ built-in 
 Locale based rules                   | ✅ built-in   | ✅ configurable        | ✅ built-in      | ✅ built-in            | ❌ not supported  | ❌ not supported
 Categorize positive integers         | ✅ built-in   | ✅ built-in            | ✅ built-in      | ✅ built-in            | ❌ not supported  | ❌ not supported
 Supports cardinal plurals (2nd, 3rd) | ✅ built-in   | ❌ not supported       | ❌ not supported | 🚧 partial support     | ❌ not supported  | ❌ not supported
 Categorize negative integers         | ✅ built-in   | ❌ handled incorrectly | ✅ built-in      | ❌ handled incorrectly | ❌ not supported  | ❌ not supported
 Categorize floating point numbers    | ✅ built-in   | ❌ handled incorrectly | ✅ built-in      | 🚧 partial support     | ❌ not supported  | ❌ not supported
 Differentiate between 1.5 and 1.50   | ✅ built-in   | ❌ not supported       | ✅ built-in      | ❌ not supported       | ❌ not supported  | ❌ not supported
 Categorize exponents                 | ✅ built-in   | ❌ not supported       | ❌ not supported | ❌ not supported       | ❌ not supported  | ❌ not supported
 Can categorize ranges                | ✅ built-in   | ❌ not supported       | ❌ not supported | ❌ not supported       | ❌ not supported  | ❌ not supported


