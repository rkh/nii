<!-- This file has been generated. Source: languages/_template.md.erb -->

# Aghem

## Installation

In order to use Aghem with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Aghem
nii = Nii::Context.new "agq" # => #<Nii::Context:agq-CM>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 FCFA"
nii.format Nii::Territory["CM"]              # => "Kàmàlûŋ"
nii.format ["de", "fr", "it"], as: :language # => "Dzamɛ̀, Kɨ̀fàlàŋsi, Ètalìa"
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
      <td><code>agq-CM</code></td>
      <td>Aghem (Cameroon)</td>
      <td><code>agq</code></td>
    </tr>
  </tbody>
</table>

