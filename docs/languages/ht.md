<!-- This file has been generated. Source: languages/_template.md.erb -->

# Haitian Creole

## Installation

In order to use Haitian Creole with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Haitian Creole
nii = Nii::Context.new "ht" # => #<Nii::Context:ht-001>

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
      <td><code>ht</code></td>
      <td>Haitian Creole</td>
      <td><code>hat</code></td>
    </tr>
  </tbody>
</table>

