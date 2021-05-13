### Example
## This is a very nice example file.

# This is a comment
-key           = term-value
key            = value
with-variable  = Hi {$name}.
with-term      = {-key}!
with-message   = {key}!
with-attribute = {with-attribute.attribute}
  .attribute   = 42
with-shared    = {-shared-term}
number         = { NUMBER($value, numberingSystem: "roman") }
string         = { "\"hi\" \u0042 \U01f44b" }


with-plurals =
  result: { $count ->
    [0]     none
    [one]   just one
   *[other] many
  }

# example from fluent docs
your-score =
    { NUMBER($score, minimumFractionDigits: 1) ->
        [0.0]   You scored zero points. What happened?
       *[other] You scored { NUMBER($score, minimumFractionDigits: 1) } points.
    }

# example from fluent docs
your-rank = { NUMBER($pos, type: "ordinal") ->
   [1] You finished first!
   [one] You finished {$pos}st
   [two] You finished {$pos}nd
   [few] You finished {$pos}rd
  *[other] You finished {$pos}th
}
