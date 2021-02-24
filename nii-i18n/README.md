# nii-i18n

[Ruby I18n](https://github.com/ruby-i18n/i18n) integration tools for [Nii](https://github.com/rkh/nii).

## Do you need this?

You only need this if you want or have to use Ruby I18n and Nii in parallel, within the same process, and need coordination between the two.

If you use nii-rails, it will already take care of the minimum coordination required to make the Rails internals (which are unfortunately hardwired to Ruby I18n's internals, not just its public API). If all you want to do is read Ruby I18n localization files (in their standard YAML, JSON, or Ruby format), you don't need this gem, as `nii-core` can read those files out of the box.

## What's included?

* `Backend`: Use Nii as a backend for Ruby I18n, so `I18n.translate` calls are processed by Nii.
* `Fallbacks`: Let Ruby I18n use Nii's locale parser and fallback logic.
* `Middleware`: A Rack middleware to automatically enable synchronization for a rack request.
* `Synchronize`: Keep `I18n.locale` and `Nii::Context#locale` in sync.
* `Setup`: Get all of the above wired up with Nii's convenient setup DSL.
