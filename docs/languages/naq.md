<!-- This file has been generated. Source: languages/_template.md.erb -->

# Nama

## Installation

In order to use Nama with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Nama
nii = Nii::Context.new "naq" # => #<Nii::Context:naq-NA>

# Value formatting
nii.format 9.99, style: :currency            # => "ZAR 9.99"
nii.format Nii::Territory["NA"]              # => "Namibiab"
nii.format ["de", "fr", "it"], as: :language # => "Duits, Frans, Italians"
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
      <td><code>naq-NA</code></td>
      <td>Nama (Namibia)</td>
      <td><code>naq</code></td>
    </tr>
  </tbody>
</table>

