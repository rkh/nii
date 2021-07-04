<!-- This file has been generated. Source: languages/_template.md.erb -->

# Hebrew

## Installation

You do not need any additional libraries to use Hebrew with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Hebrew
nii = Nii::Context.new "he" # => #<Nii::Context:he-IL>

# Value formatting
nii.format 9.99, style: :currency            # => "‏9.99 ₪"
nii.format Nii::Territory["IL"]              # => "ישראל"
nii.format ["de", "fr", "it"], as: :language # => "גרמנית, צרפתית ואיטלקית"

# Spelling out numbers
nii.numbers.spellout 115                          # => "מאה וחמש עשרה"
nii.numbers.spellout 1                            # => "אחת"
nii.numbers.spellout 2020, :year                  # => "אלפיים עשרים"
nii.numbers.spellout 115,  :masculine             # => "מאה וחמישה עשר"
nii.numbers.spellout 115,  :construct, :masculine # => "מאה וחמישה עשר"
nii.numbers.spellout 115,  :ordinal, :masculine   # => "מאה וחמישה עשר"
nii.numbers.spellout 1,    :ordinal, :feminine    # => "ראשונה"
```


## Locales

<table>
  <thead>
    <tr>
      <th>Locale Tag</th>
      <th>Description</th>
      <th>Aliases</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>he-IL</code></td>
      <td>Hebrew (Israel)</td>
      <td><code>he</code>, <code>heb</code>, and <code>iw</code></td>
    </tr>
  </tbody>
</table>

