<!-- This file has been generated. Source: languages/_template.md.erb -->

# Inari Sami

## Installation

In order to use Inari Sami with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Inari Sami
nii = Nii::Context.new "smn" # => #<Nii::Context:smn-FI>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 €"
nii.format Nii::Territory["FI"]              # => "Suomâ"
nii.format ["de", "fr", "it"], as: :language # => "saksakielâ, ranskakielâ, italiakielâ"
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
      <td><code>smn-FI</code></td>
      <td>Inari Sami (Finland)</td>
      <td><code>smn</code></td>
    </tr>
  </tbody>
</table>

