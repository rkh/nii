<!-- This file has been generated. Source: languages/_template.md.erb -->

# Slovak

## Installation

You do not need any additional libraries to use Slovak with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Slovak
nii = Nii::Context.new "sk" # => #<Nii::Context:sk-SK>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 €"
nii.format Nii::Territory["SK"]              # => "Slovensko"
nii.format ["de", "fr", "it"], as: :language # => "nemčina, francúzština a taliančina"

# Spelling out numbers
nii.numbers.spellout 1               # => "jeden"
nii.numbers.spellout 115             # => "jedna­sto pätnásť"
nii.numbers.spellout 2020, :year     # => "dve tisíc dvadsať"
nii.numbers.spellout 1,    :neuter   # => "jedno"
nii.numbers.spellout 1,    :feminine # => "jedna"
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
      <td><code>sk-SK</code></td>
      <td>Slovak (Slovakia)</td>
      <td><code>sk</code>, <code>slk</code>, and <code>slo</code></td>
    </tr>
  </tbody>
</table>

