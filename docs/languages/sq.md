<!-- This file has been generated. Source: languages/_template.md.erb -->

# Albanian

## Installation

You do not need any additional libraries to use Albanian with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Albanian
nii = Nii::Context.new "sq" # => #<Nii::Context:sq-AL>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 Lekë"
nii.format Nii::Territory["AL"]              # => "Shqipëri"
nii.format ["de", "fr", "it"], as: :language # => "gjermanisht, frëngjisht dhe italisht"

# Spelling out numbers
nii.numbers.spellout 115         # => "njëqind e pesëmbëdhjetë"
nii.numbers.spellout 1           # => "një"
nii.numbers.spellout 2020, :year # => "dy mijë e njëzet"
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
      <td><code>sq-AL</code></td>
      <td>Albanian (Albania)</td>
      <td><code>sq</code>, <code>alb</code>, <code>als</code>, and <code>sqi</code></td>
    </tr>
    <tr>
      <td><code>sq-MK</code></td>
      <td>Albanian (North Macedonia)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>sq-XK</code></td>
      <td>Albanian (Kosovo)</td>
      <td></td>
    </tr>
  </tbody>
</table>

