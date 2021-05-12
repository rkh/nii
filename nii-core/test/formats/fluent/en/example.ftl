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
number         = {NUMBER($value, numberingSystem: "roman")}
