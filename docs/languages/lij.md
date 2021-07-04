<!-- This file has been generated. Source: languages/_template.md.erb -->

# Ligurian

## Installation

In order to use Ligurian with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Ligurian
nii = Nii::Context.new "lij" # => #<Nii::Context:lij-001>

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
      <td><code>lij</code></td>
      <td>Ligurian</td>
    </tr>
  </tbody>
</table>

