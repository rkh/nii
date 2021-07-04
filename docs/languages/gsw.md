<!-- This file has been generated. Source: languages/_template.md.erb -->

# Swiss German

## Installation

In order to use Swiss German with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Swiss German
nii = Nii::Context.new "gsw" # => #<Nii::Context:gsw-CH>

# Value formatting
nii.format 9.99, style: :currency            # => "9.99 CHF"
nii.format Nii::Territory["CH"]              # => "Schwiiz"
nii.format ["de", "fr", "it"], as: :language # => "Tüütsch, Französisch und Italiänisch"
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
      <td><code>gsw-CH</code></td>
      <td>Swiss German (Switzerland)</td>
      <td><code>gsw</code></td>
    </tr>
    <tr>
      <td><code>gsw-FR</code></td>
      <td>Swiss German (France)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>gsw-LI</code></td>
      <td>Swiss German (Liechtenstein)</td>
      <td></td>
    </tr>
  </tbody>
</table>

