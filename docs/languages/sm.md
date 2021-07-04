<!-- This file has been generated. Source: languages/_template.md.erb -->

# Samoan

## Installation

In order to use Samoan with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Samoan
nii = Nii::Context.new "sm" # => #<Nii::Context:sm-001>

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
      <td><code>sm</code></td>
      <td>Samoan</td>
      <td><code>smo</code></td>
    </tr>
  </tbody>
</table>

