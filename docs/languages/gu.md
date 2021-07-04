<!-- This file has been generated. Source: languages/_template.md.erb -->

# Gujarati

## Installation

You do not need any additional libraries to use Gujarati with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Gujarati
nii = Nii::Context.new "gu" # => #<Nii::Context:gu-IN>

# Value formatting
nii.format 9.99, style: :currency            # => "₹9.99"
nii.format Nii::Territory["IN"]              # => "ભારત"
nii.format ["de", "fr", "it"], as: :language # => "જર્મન, ફ્રેન્ચ અને ઇટાલિયન"
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
      <td><code>gu-IN</code></td>
      <td>Gujarati (India)</td>
      <td><code>gu</code> and <code>guj</code></td>
    </tr>
  </tbody>
</table>

