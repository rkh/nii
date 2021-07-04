<!-- This file has been generated. Source: languages/_template.md.erb -->

# Xhosa

## Installation

In order to use Xhosa with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Xhosa
nii = Nii::Context.new "xh" # => #<Nii::Context:xh-ZA>

# Value formatting
nii.format 9.99, style: :currency            # => "R 9.99"
nii.format Nii::Territory["ZA"]              # => "eMzantsi Afrika"
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
      <td><code>xh-ZA</code></td>
      <td>Xhosa (South Africa)</td>
      <td><code>xh</code> and <code>xho</code></td>
    </tr>
  </tbody>
</table>

