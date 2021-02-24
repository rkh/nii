---
title: Fluent
css_class: formats
layout: format
---

Fluent is a localization system for natural-sounding translations, developed by Mozilla.
It is powerful, but readable.

## Should you use Fluent?

The short answer is yes. Fluent allows you to make the most out of Nii, and it is the format used in most of the documentation.

The main reason not to use Fluent is the limited number of external tools available. At the time of writing,
[Pontoon](https://github.com/mozilla/pontoon) is the only major localization UI that supports Fluent, though
other tools (like [Weblate](https://weblate.org/)) do have support on their roadmap.

You can work around this limitation by converting Fluent files into [XLIFF](/formats/xliff) files and back.

## Example

### [en/hello.ftl](https://projectfluent.org/play/?id=7d9d7156ec0050b16a21d22499056fd8)

``` ftl
hello-world = Hello World!

# Greeting someone.
#   $name (String) - Name of the person being greeted.
hello-user = Hello {$name}!
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

### Messages

A message in fluent is defined by a key value pair (message identifier mapped to a template):

``` fluent
message = This is an example message!
```

Messages can be multi-line, using indentation:

``` fluent
message =
  A Fluent message may start on the same line as the key,
  but doesn't have to. The indentation will be stripped
  from the resulting String.
```

### Terms

Terms are like private messages: They are accessible from within the Fluent document, but not from the code.
They are defined just like messages, but their name is prefixed with a dash:

``` fluent
-example = Terms start with a dash.
```

Think of them as variables for the translator, not the developer.
These are useful for interpolation.

### Attributes

A message or term can have multiple attributes.

``` fluent
login-email    = email address
  .placeholder = mail@example.com
  .title       = Type your login email
```

### Interpolation

Interpolation in Fluent is with so called placeables, surrounded by curly braces.
There are multiple types of placeables.

A literal string (useful for escaping):

``` fluent
example-with-string = Curly braces: {"{"}
```

A variable:

``` fluent
example-with-variable = Welcome to {$title}.
```

A reference to another message, term, or attribute:

``` fluent
-example-animal   = elephant
example-with-term = Did you see the {-example-animal}?

# You may also pass a variable to a term:
-example-elephant = {$origin} elephant
example-with-pass =
  Did you see the {-example-elephant(origin: "African")}?
```

A function call:

``` fluent
title = Fantasy Game { NUMBER($edition, numbers: "roman") }
```

Or a variant selector:

``` fluent
message-count =
  You have { $count -> 
    [0]     no new messages
    [one]   one new message
   *[other] {$count} new messages
  } waiting for you.
```

Selectors can be used to choose a variant based on a placeable, so you can use them on a variable, function call, term attribute, and so on.
They are especially useful for grammatical features, like plural categories, cases, grammatical gender, etc.

### Comments

Comments in Fluent are prefixed with one, two, or three hash symbols, followed by a space, and then the actual comment:

* Single hash comments are either stand-alone comments, or bound to a message (by directly preceding it).
* Double hash comments can be used to divide the file in sections.
* Triple hash comment apply to the entire file, regardless of position.

There is also [a proposal](https://github.com/projectfluent/fluent/projects/5) for semantic comments, which may in the future
become part of the official Fluent specification.

``` fluent
## User Greetings

# A greeting displayed to returning users.
#   $name (String) - the user's name.
#   $count (Number) - days since we last saw the user.
welcome-back = Welcome {$name}, it's been {$count} days.
```

## Relevant Reading

### General Information

* [Project Fluent](https://projectfluent.org/)
* [Fluent Syntax Guide](https://projectfluent.org/fluent/guide/)
* [Fluent Wiki](https://github.com/projectfluent/fluent/wiki)

### Editor Support

* [Vim/Neovim](https://github.com/projectfluent/fluent.vim)
* [Visual Studio Code](Visual Studio Code)

### Other Implementations

 Language   | Libraries
------------|----------------
 C#         | [Fluent.Net](https://github.com/blushingpenguin/Fluent.Net)
 D          | [fluentd](https://github.com/SirNickolas/fluentd)
 Dart       | [fluent-dart](https://github.com/ryanhz/fluent-dart)
 Elixir     | [libfluent](https://github.com/Virviil/libfluent), [fluent-ex](https://github.com/arathunku/fluent-ex), [fluex](https://github.com/0xd61/fluex)
 Elm        | [elm-fluent](https://github.com/elm-fluent/elm-fluent)
 JavaScript | **[fluent.js](https://github.com/projectfluent/fluent.js)** (official), [i18next-fluent](https://github.com/i18next/i18next-fluent)
 JVM        | **[fluent-kotlin](https://github.com/projectfluent/fluent-kotlin)** (official), [javidaloca](https://github.com/JohnnyJayJay/javidaloca)
 Lua        | [fluent-lua](https://github.com/alerque/fluent-lua)
 Perl       | [Fluent](https://github.com/alabamenhu/Fluent), [Translate-Fluent](https://github.com/magick-source/perl-translate-fluent)
 PHP        | [fluent-php](https://github.com/tacoberu/fluent-php)
 Python     | **[python-fluent](https://github.com/projectfluent/python-fluent)** (official), [django-ftl](https://github.com/django-ftl/django-ftl)
 Rust       | **[fluent-rs](https://github.com/projectfluent/fluent-rs)** (official)
 Swift      | [Fluent.swift](https://github.com/romanilchyshyn/Fluent.swift)
