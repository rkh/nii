<!-- This file has been generated. Source: languages/_template.md.erb -->

# Shona

## Installation

In order to use Shona with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Shona
nii = Nii::Context.new "sn" # => #<Nii::Context:sn-ZW>

# Value formatting
nii.format 9.99, style: :currency            # => "US$9.99"
nii.format Nii::Territory["ZW"]              # => "Zimbabwe"
nii.format ["de", "fr", "it"], as: :language # => "chiJerimani, chiFurenchi, chiTariana"
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
      <td><code>sn-ZW</code></td>
      <td>Shona (Zimbabwe)</td>
      <td><code>sn</code> and <code>sna</code></td>
    </tr>
  </tbody>
</table>

