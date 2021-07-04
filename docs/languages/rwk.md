<!-- This file has been generated. Source: languages/_template.md.erb -->

# Rwa

## Installation

In order to use Rwa with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Rwa
nii = Nii::Context.new "rwk" # => #<Nii::Context:rwk-TZ>

# Value formatting
nii.format 9.99, style: :currency            # => "9.99 TSh"
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
      <td><code>rwk-TZ</code></td>
      <td>Rwa (Tanzania)</td>
      <td><code>rwk</code></td>
    </tr>
  </tbody>
</table>

