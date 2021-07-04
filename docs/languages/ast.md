<!-- This file has been generated. Source: languages/_template.md.erb -->

# Asturian

## Installation

In order to use Asturian with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Asturian
nii = Nii::Context.new "ast" # => #<Nii::Context:ast-ES>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 €"
nii.format Nii::Territory["ES"]              # => "España"
nii.format ["de", "fr", "it"], as: :language # => "alemán, francés y italianu"
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
      <td><code>ast-ES</code></td>
      <td>Asturian (Spain)</td>
      <td><code>ast</code></td>
    </tr>
  </tbody>
</table>

