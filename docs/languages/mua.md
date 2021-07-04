<!-- This file has been generated. Source: languages/_template.md.erb -->

# Mundang

## Installation

In order to use Mundang with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Mundang
nii = Nii::Context.new "mua" # => #<Nii::Context:mua-CM>

# Value formatting
nii.format 9.99, style: :currency            # => "FCFA 9,99"
nii.format Nii::Territory["CM"]              # => "kameruŋ"
nii.format ["de", "fr", "it"], as: :language # => "germaŋ, zah sǝr Franssǝ, italiya"
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
      <td><code>mua-CM</code></td>
      <td>Mundang (Cameroon)</td>
      <td><code>mua</code></td>
    </tr>
  </tbody>
</table>

