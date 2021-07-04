<!-- This file has been generated. Source: languages/_template.md.erb -->

# Uyghur

## Installation

In order to use Uyghur with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Uyghur
nii = Nii::Context.new "ug" # => #<Nii::Context:ug-CN>

# Value formatting
nii.format 9.99, style: :currency            # => "￥9.99"
nii.format Nii::Territory["CN"]              # => "جۇڭگو"
nii.format ["de", "fr", "it"], as: :language # => "گېرمانچە, فىرانسۇزچە, and ئىتالىيانچە"
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
      <td><code>ug-CN</code></td>
      <td>Uyghur (China)</td>
      <td><code>ug</code> and <code>uig</code></td>
    </tr>
    <tr>
      <td><code>ug-Cyrl</code></td>
      <td>Uyghur (Cyrillic)</td>
      <td></td>
    </tr>
  </tbody>
</table>

