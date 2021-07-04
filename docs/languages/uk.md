<!-- This file has been generated. Source: languages/_template.md.erb -->

# Ukrainian

## Installation

You do not need any additional libraries to use Ukrainian with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Ukrainian
nii = Nii::Context.new "uk" # => #<Nii::Context:uk-UA>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 ₴"
nii.format Nii::Territory["UA"]              # => "Україна"
nii.format ["de", "fr", "it"], as: :language # => "німецька, французька і італійська"

# Spelling out numbers
nii.numbers.spellout 115             # => "сто пʼятнадцять"
nii.numbers.spellout 1               # => "один"
nii.numbers.spellout 2020, :year     # => "дві  двадцять"
nii.numbers.spellout 1,    :neuter   # => "одне"
nii.numbers.spellout 1,    :feminine # => "одна"
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
      <td><code>uk-UA</code></td>
      <td>Ukrainian (Ukraine)</td>
      <td><code>uk</code> and <code>ukr</code></td>
    </tr>
  </tbody>
</table>

