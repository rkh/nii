<!-- This file has been generated. Source: languages/_template.md.erb -->

# Interlingua

## Installation

In order to use Interlingua with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Interlingua
nii = Nii::Context.new "ia" # => #<Nii::Context:ia-001>

# Value formatting
nii.format 9.99, currency: "USD"             # => "US$ 9,99"
nii.format Nii::Territory["001"]             # => "Mundo"
nii.format ["de", "fr", "it"], as: :language # => "germano, francese e italiano"
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
      <td><code>ia-001</code></td>
      <td>Interlingua (world)</td>
      <td><code>ia</code> and <code>ina</code></td>
    </tr>
  </tbody>
</table>

