<!-- This file has been generated. Source: languages/_template.md.erb -->

# Blin

## Installation

In order to use Blin with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Blin
nii = Nii::Context.new "byn" # => #<Nii::Context:byn-001>

# Value formatting
nii.format 9.99, currency: "USD"             # => "US$ 9.99"
nii.format Nii::Territory["001"]             # => "001"
nii.format ["de", "fr", "it"], as: :language # => "de, fr, it"
```


## Locales

<table>
  <thead>
    <tr>
      <th>Locale Tag</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>byn-Latn</code></td>
      <td>Blin (Latin)</td>
    </tr>
  </tbody>
</table>

