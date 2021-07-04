<!-- This file has been generated. Source: languages/_template.md.erb -->

# Inuktitut

## Installation

In order to use Inuktitut with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Inuktitut
nii = Nii::Context.new "iu" # => #<Nii::Context:iu-001>

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
      <td><code>iu-Latn</code></td>
      <td>Inuktitut (Latin)</td>
    </tr>
  </tbody>
</table>
