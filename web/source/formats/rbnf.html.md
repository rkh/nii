---
title: Unicode RBNF
css_class: formats
layout: format
---

RBNF is used by Unicode projects like the CLDR and ICU for advanced number formatting.

It is used internally for spell out rules and non-decimal numbering systems.

## Example

### en/spell.rbnf

``` rbnf
-x:  MINUS →→; x.x: ←← POINT →→;
0: ZERO; 1: ONE OR TWO; 3: THREE; 4: MORE THAN THREE;
```

### example.rb

``` ruby
context = Nii::Context.new "en", lookup: "."
context.render "spell", 2.5
# => "ONE OR TWO POINT MORE THAN THREE"
```

## Should you use RBNF?

You probably should not use RBNF directly. However, if you are creating your own numbering system or spell out rules, then RBNF might be the right choice.

## Relevant Reading

* [ICU documentation](https://unicode-org.github.io/icu/userguide/format_parse/numbers/rbnf.html) (note that Nii uses CLDR syntax, not ICU syntax)
