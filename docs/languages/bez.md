<!-- This file has been generated. Source: languages/_template.md.erb -->

# Bena

## Installation

In order to use Bena with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Bena
nii = Nii::Context.new "bez" # => #<Nii::Context:bez-TZ>

# Value formatting
nii.format 9.99, style: :currency            # => "9.99 TSh"
nii.format Nii::Territory["TZ"]              # => "Hutanzania"
nii.format ["de", "fr", "it"], as: :language # => "Hijerumani, Hifaransa, Hiitaliano"
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
      <td><code>bez-TZ</code></td>
      <td>Bena (Tanzania)</td>
      <td><code>bez</code></td>
    </tr>
  </tbody>
</table>

