# nii-slim

Advanced [Nii](https://nii.dev) integration for [Slim](http://slim-lang.com/) templates.

## Automatic Value Formatting

``` slim
span data-value=value = value
```

Return values that aren't inside HTML attributes will be formatted with Nii:

``` ruby
require "nii-slim"

template = Slim::Template.new('exmaple.slim')
template.render(nil, value: 1530)              # => '<span data-value="1530">1,530</span>'
template.render(nil, value: 1530, locale: :de) # => '<span data-value="1530">1.530</span>'

context = Nii::Context.new(numbering_system: :roman)
template.render(nil, value: 1530, nii: context) # => '<span data-value="1530">MDXXX</span>'
```

This also works well with a rendering scope that uses `Nii::Helpers`:

``` ruby
class MyApp
  include Nii::Helpers
  def value = 1530
end

scope     = MyApp.new
scope.nii = Nii::Context.new :ar

template.render(scope) # => '<span data-value="1530">١٬٥٣٠</span>'
```

## Embedded Translations

You can embed a translation by prefixing the line with a dollar sign:

``` slim
.example
  $ example-message
```

This will look up the translation for `example-message` and place it in the generated HTML tag.

Local variables are automatically exposed to the message templates, but can also be passed as Ruby-style arguments.

`locales/en/greeting.ftl`:

``` fluent
greeting = Hi {$name}!
```

`example.slim`:

``` slim
.from-render
  $ greeting

.from-argument
  $ greeting(name: "User B")

- users.each do |name|
  .from-block
    $ greeting

.array-example
  $ greeting(name: users)
```

`example.rb`:

``` ruby
require "nii-slim"
Slim::Engine.set_options pretty: true

messages = Nii["locales"]
template = Slim::Template.new "example.slim"
context  = Nii::Context.new(:en, messages)

puts template.render(nil, nii: context, name: "User A", users: ["User C", "User D"])
```

Output:

``` html
<div class="from-render">
  Hi User A!
</div>
<div class="from-argument">
  Hi User B!
</div>
<div class="from-block">
  Hi User C!
</div>
<div class="from-block">
  Hi User D!
</div>
<div class="array-example">
  Hi User C and User D!
</div>
```

## Installation

For the plugin to be active, you need to load both slim and nii-slim:

``` ruby
require "slim"
require "nii-slim"
```

In Rails it is sufficient to add them to your Gemfile (as ungrouped gems are loaded automatically):

``` ruby
gem "slim"
gem "nii-slim"
```

### Compatibility

This library is not compatible with:
* Slim's smart mode – they cannot be loaded at the same time.
* Slim's auto translator – they can be loaded at the same time, but Slim::Translator will not pick up Nii.

This library is compatible with:
* Slim's logic less mode.
* All standard Slim features.

