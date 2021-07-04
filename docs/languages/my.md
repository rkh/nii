<!-- This file has been generated. Source: languages/_template.md.erb -->

# Burmese

## Installation

You do not need any additional libraries to use Burmese with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Burmese
nii = Nii::Context.new "my" # => #<Nii::Context:my-MM>

# Value formatting
nii.format 9.99, style: :currency            # => "၉.၉၉ K"
nii.format Nii::Territory["MM"]              # => "မြန်မာ"
nii.format ["de", "fr", "it"], as: :language # => "ဂျာမန်၊ ပြင်သစ်နှင့် အီတလီ"
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
      <td><code>my-MM</code></td>
      <td>Burmese (Myanmar (Burma))</td>
      <td><code>my</code>, <code>bur</code>, and <code>mya</code></td>
    </tr>
  </tbody>
</table>

