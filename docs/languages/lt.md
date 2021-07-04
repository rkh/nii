<!-- This file has been generated. Source: languages/_template.md.erb -->

# Lithuanian

## Installation

You do not need any additional libraries to use Lithuanian with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Lithuanian
nii = Nii::Context.new "lt" # => #<Nii::Context:lt-LT>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 €"
nii.format Nii::Territory["LT"]              # => "Lietuva"
nii.format ["de", "fr", "it"], as: :language # => "vokiečių, prancūzų ir italų"

# Spelling out numbers
nii.numbers.spellout 115             # => "šimtas penkiolika"
nii.numbers.spellout 1               # => "vienas"
nii.numbers.spellout 2020, :year     # => "du tūkstančiai dvidešimt"
nii.numbers.spellout 1,    :feminine # => "viena"
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
      <td><code>lt-LT</code></td>
      <td>Lithuanian (Lithuania)</td>
      <td><code>lt</code> and <code>lit</code></td>
    </tr>
  </tbody>
</table>

