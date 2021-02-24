---
title: Application Resource Bundle
css_class: formats
layout: format
---

Application Resource Bundle (ARB) is a file format developed by Google, most prominently used by [Flutter](https://flutter.dev/).

## Should you use ARB files?

The main reason to use ARB files is to reuse translations you already have from a Flutter application.

JSON and therefore ARB is not a great format to edit by hand, especially for less technical collaborators (think of your translators).
Most editors and highlighters also lack support for the interpolation format, making it harder to spot syntax errors.

Unless you already have great tooling in place for your translators to use when working with ARB files, we'd recommend you take a look at the other formats.

## Example

### en/hello.arb
``` json
{
  "@@locale":          "en",
  "hello_world":       "Hello world!",
  "hello_user":        "Hello {name}!",
  "@hello_user": {
    "description":     "Greeing someone.",
    "placeholders": {
      "name": {
        "example":     "Jane",
        "description": "Name of the person being greeted."
      }
    }
  }
}
```

### example.rb

``` ruby
context = Nii::Context.new "en", lookup: ".", namespace: "hello"

context.render "hello-world"
# => "Hello World!"

context.render "hello-user", { user: "Jane" }
# => "Hello Jane!"
```

## Syntax

ARB is based on JSON, with messages stored in a direct message key to message template mapping (making ARB a superset of [Simple JSON](/formats/json)). ARB messages support interpolation with ICU compatible syntax.

In addition, ARB files may contain meta data, with meta data keys being prefixed with either a single at sign for per-message meta data, or two at signs for file wide meta data.

## Relevant Reading

* [Specification](https://github.com/google/app-resource-bundle/wiki/ApplicationResourceBundleSpecification)
* [Internationalizing Flutter apps](https://flutter.dev/docs/development/accessibility-and-localization/internationalization)
* [google/app-resource-bundle](https://github.com/google/app-resource-bundle) on GitHub
