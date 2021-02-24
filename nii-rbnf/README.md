# Rule Based Number Formatting for Ruby

This library implements an RBNF rule set parser and compiler for Ruby projects.
It aims to be fully compatible with the format used in the Unicode Common Locale Data Repository.

Despite its name, this library does not depend on [Nii](https://github.com/rkh/nii) (I would have called it "rbnf", but that was already taken).

## Example Usage

You can use the following `roman.rbnf` to generate roman numerals:

```
-x: −→→; x.x: =#,##0.00=; 0: n;

   1: i;        2: ii;        3: iii;        4: iv;          5: v;       6: vi;       7: vii;       8: viii;       9: ix;
  10: x[→→];   20: xx[→→];   30: xxx[→→];   40: xl[→→];     50: l[→→];  60: lx[→→];  70: lxx[→→];  80: lxxx[→→];  90: xc[→→];
 100: c[→→];  200: cc[→→];  300: ccc[→→];  400: cd[→→];    500: d[→→]; 600: dc[→→]; 700: dcc[→→]; 800: dccc[→→]; 900: cm[→→];
1000: m[→→]; 2000: mm[→→]; 3000: mmm[→→]; 4000: mmmm[→→]; 5000: =#,##0=;
```

With this Ruby code:

``` ruby
require 'nii/rbnf'

roman = Nii::RBNF.load_file 'roman.rbnf'
roman.format(2021) # => "mmxxi"
```

## Plural Categories

Some RBNF definitions need to determine plural categories. If that is the case, you can pass a block to `load`/`load_file`.

``` ruby
# this is an actual example from the CLDR
source = "%digits-ordinal: -x: −→→; 0: =#,##0=$(ordinal,one{st}two{nd}few{rd}other{th})$;"

en = Nii::RBNF.load(source) do |type, number|
  case number
  when 1 then 'one'
  when 2 then type == 'ordinal' ? 'two' : 'other'
  when 3 then type == 'ordinal' ? 'few' : 'other'
  else 'other'
  end
end

(1..5).map { |i| en.format(i, 'digits-ordinal') } # => ["1st", "2nd", "3rd", "4th", "5th"]
```

## Missing Features

* Parsing: It is technically possible to use RBNF definitions to also parse numbers.
* Exponents: Decimal formats do not support the E notation.
* Configurable tokens: The ICU API uses `<<>>`, but this library only implements `←←→→` (as is used in LDML).
