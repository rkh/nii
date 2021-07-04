<!-- This file has been generated. Source: languages/_template.md.erb -->

# Vunjo

## Installation

In order to use Vunjo with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Vunjo
nii = Nii::Context.new "vun" # => #<Nii::Context:vun-TZ>

# Value formatting
nii.format 9.99, style: :currency            # => "TSh 9.99"
nii.format Nii::Territory["TZ"]              # => "Tanzania"
nii.format ["de", "fr", "it"], as: :language # => "Kyijerumani, Kyifaransa, Kyiitaliano"
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
      <td><code>vun-TZ</code></td>
      <td>Vunjo (Tanzania)</td>
      <td><code>vun</code></td>
    </tr>
  </tbody>
</table>

