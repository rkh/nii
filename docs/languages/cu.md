<!-- This file has been generated. Source: languages/_template.md.erb -->

# Church Slavic

## Installation

In order to use Church Slavic with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Church Slavic
nii = Nii::Context.new "cu" # => #<Nii::Context:cu-001>

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
      <th>Aliases</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>cu</code></td>
      <td>Church Slavic</td>
      <td><code>chu</code></td>
    </tr>
    <tr>
      <td><code>cu-Glag</code></td>
      <td>Church Slavic (Glagolitic)</td>
      <td></td>
    </tr>
  </tbody>
</table>

