# nii-slim

Advanced [Nii](https://nii.dev) integration for [Slim](http://slim-lang.com/) templates.

## Features

### Automatic Value Formatting

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

## Installation and Setup

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


