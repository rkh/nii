<!-- This file has been generated. Source: languages/_template.md.erb -->

# Machame

## Installation

In order to use Machame with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Machame
nii = Nii::Context.new "jmc" # => #<Nii::Context:jmc-TZ>

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
      <td><code>jmc-TZ</code></td>
      <td>Machame (Tanzania)</td>
      <td><code>jmc</code></td>
    </tr>
  </tbody>
</table>

