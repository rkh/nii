<!-- This file has been generated. Source: languages/_template.md.erb -->

# Sena

## Installation

In order to use Sena with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Sena
nii = Nii::Context.new "seh" # => #<Nii::Context:seh-MZ>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 MTn"
nii.format Nii::Territory["MZ"]              # => "Moçambique"
nii.format ["de", "fr", "it"], as: :language # => "alemão, francês, italiano"
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
      <td><code>seh-MZ</code></td>
      <td>Sena (Mozambique)</td>
      <td><code>seh</code></td>
    </tr>
  </tbody>
</table>
