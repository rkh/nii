## Important Objects and Methods

The most important objects and methods are:

### {Nii::Context}

* {Nii::Context#localize} and {Nii::Context#format} to turn a Ruby object into a localized representation.
* {Nii::Context#render} to render a custom message from the message templates.

For better compatibility with Ruby I18n, `localize` is aliased to `l`, and `render` is aliased to `t`/`translate`.

``` ruby
config = Nii["config/locales"] # simple configuration loading messages from config/locales
i18n   = Nii::Context.new("en-US", config)

i18n.t "example"  # looks for a message with the id "example"
i18n.l Date.today # localizes the current date
```

### {Nii::Helpers}

A mixin that adds `translate`/`t` and `localize`/`l` helper methods to your object. Useful for view classes, controllers, and/or serializers.

``` ruby
class MyView
  include Nii::Helpers
end

# exposes helper methods to a slim template
Slim::Template.new("example.slim").render MyView.new
```

### {Nii::Setup}

Setup API to configure Nii.

``` ruby
Nii::Setup.new MyView do
  lookup "config/locales"
  domain("example.com") { locale "en-US" }
  domain("beispiel.de") { locale "de-DE" }
end
```
