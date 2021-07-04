<!-- This file has been generated. Source: languages/_template.md.erb -->

# Kannada

## Installation

You do not need any additional libraries to use Kannada with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Kannada
nii = Nii::Context.new "kn" # => #<Nii::Context:kn-IN>

# Value formatting
nii.format 9.99, style: :currency            # => "₹9.99"
nii.format Nii::Territory["IN"]              # => "ಭಾರತ"
nii.format ["de", "fr", "it"], as: :language # => "ಜರ್ಮನ್, ಫ್ರೆಂಚ್, ಮತ್ತು ಇಟಾಲಿಯನ್"
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
      <td><code>kn-IN</code></td>
      <td>Kannada (India)</td>
      <td><code>kn</code> and <code>kan</code></td>
    </tr>
  </tbody>
</table>

