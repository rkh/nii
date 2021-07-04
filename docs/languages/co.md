<!-- This file has been generated. Source: languages/_template.md.erb -->

# Corsican

## Installation

In order to use Corsican with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Corsican
nii = Nii::Context.new "co" # => #<Nii::Context:co-001>

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
      <td><code>co</code></td>
      <td>Corsican</td>
      <td><code>cos</code></td>
    </tr>
  </tbody>
</table>

