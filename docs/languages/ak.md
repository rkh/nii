<!-- This file has been generated. Source: languages/_template.md.erb -->

# Akan

## Installation

In order to use Akan with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Akan
nii = Nii::Context.new "ak" # => #<Nii::Context:ak-GH>

# Value formatting
nii.format 9.99, style: :currency            # => "GH₵9.99"
nii.format Nii::Territory["GH"]              # => "Gaana"
nii.format ["de", "fr", "it"], as: :language # => "Gyaaman, Frɛnkye, Italy kasa"
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
      <td><code>ak-GH</code></td>
      <td>Akan (Ghana)</td>
      <td><code>ak</code>, <code>aka</code>, <code>fat</code>, <code>tw</code>, and <code>twi</code></td>
    </tr>
  </tbody>
</table>

