<!-- This file has been generated. Source: languages/_template.md.erb -->

# Rombo

## Installation

In order to use Rombo with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Rombo
nii = Nii::Context.new "rof" # => #<Nii::Context:rof-TZ>

# Value formatting
nii.format 9.99, style: :currency            # => "TSh 9.99"
nii.format Nii::Territory["TZ"]              # => "Tanzania"
nii.format ["de", "fr", "it"], as: :language # => "Kijerumani, Kyifaransa, Kiitaliano"
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
      <td><code>rof-TZ</code></td>
      <td>Rombo (Tanzania)</td>
      <td><code>rof</code></td>
    </tr>
  </tbody>
</table>

