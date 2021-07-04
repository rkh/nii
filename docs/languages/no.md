<!-- This file has been generated. Source: languages/_template.md.erb -->

# Norwegian

## Installation

You do not need any additional libraries to use Norwegian with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Norwegian
nii = Nii::Context.new "no" # => #<Nii::Context:no-001>

# Value formatting
nii.format 9.99, currency: "USD"             # => "USD 9,99"
nii.format Nii::Territory["001"]             # => "verden"
nii.format ["de", "fr", "it"], as: :language # => "tysk, fransk og italiensk"

# Spelling out numbers
nii.numbers.spellout 1                          # => "én"
nii.numbers.spellout 115                        # => "hundre og femten"
nii.numbers.spellout 2020                       # => "to tusen og tjue"
nii.numbers.spellout 2020, :year                # => "tjue­hundre og tjue"
nii.numbers.spellout 1,    :feminine            # => "ei"
nii.numbers.spellout 1,    :neuter              # => "ett"
nii.numbers.spellout 1,    :ordinal, :masculine # => "første"
nii.numbers.spellout 115,  :ordinal, :masculine # => "én­hundre femtende"
nii.numbers.spellout 1,    :ordinal, :neuter    # => "første"
nii.numbers.spellout 115,  :ordinal, :neuter    # => "én­hundre femtende"
nii.numbers.spellout 1,    :ordinal, :feminine  # => "første"
nii.numbers.spellout 115,  :ordinal, :feminine  # => "én­hundre femtende"
nii.numbers.spellout 1,    :ordinal, :plural    # => "første"
nii.numbers.spellout 115,  :ordinal, :plural    # => "én­hundre femtende"
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
      <td><code>no</code></td>
      <td>Norwegian</td>
      <td><code>nor</code></td>
    </tr>
  </tbody>
</table>

