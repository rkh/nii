<!-- This file has been generated. Source: languages/_template.md.erb -->

# Cajun French

## Installation

In order to use Cajun French with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Cajun French
nii = Nii::Context.new "frc" # => #<Nii::Context:frc-001>

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
      <td><code>frc</code></td>
      <td>Cajun French</td>
    </tr>
  </tbody>
</table>

