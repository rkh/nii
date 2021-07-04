<!-- This file has been generated. Source: languages/_template.md.erb -->

# Hungarian

## Installation

You do not need any additional libraries to use Hungarian with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Hungarian
nii = Nii::Context.new "hu" # => #<Nii::Context:hu-HU>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 Ft"
nii.format Nii::Territory["HU"]              # => "Magyarország"
nii.format ["de", "fr", "it"], as: :language # => "német, francia és olasz"

# Spelling out numbers
nii.numbers.spellout 1                        # => "egy"
nii.numbers.spellout 115                      # => "száz­tizen­öt"
nii.numbers.spellout 2020, :year              # => "két­ezer­húsz"
nii.numbers.spellout 115,  :verbose           # => "egy­száz­tizen­öt"
nii.numbers.spellout 1,    :ordinal           # => "első"
nii.numbers.spellout 115,  :ordinal           # => "száztizenötödik"
nii.numbers.spellout 1,    :ordinal, :verbose # => "első"
nii.numbers.spellout 115,  :ordinal, :verbose # => "egyszáztizenötödik"
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
      <td><code>hu-HU</code></td>
      <td>Hungarian (Hungary)</td>
      <td><code>hu</code> and <code>hun</code></td>
    </tr>
  </tbody>
</table>

