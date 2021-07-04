<!-- This file has been generated. Source: languages/_template.md.erb -->

# Duala

## Installation

In order to use Duala with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Duala
nii = Nii::Context.new "dua" # => #<Nii::Context:dua-CM>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 FCFA"
nii.format Nii::Territory["CM"]              # => "Cameroun"
nii.format ["de", "fr", "it"], as: :language # => "de, fr, it"
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
      <td><code>dua-CM</code></td>
      <td>Duala (Cameroon)</td>
      <td><code>dua</code></td>
    </tr>
  </tbody>
</table>

