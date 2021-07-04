<!-- This file has been generated. Source: languages/_template.md.erb -->

# Maltese

## Installation

In order to use Maltese with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Maltese
nii = Nii::Context.new "mt" # => #<Nii::Context:mt-MT>

# Value formatting
nii.format 9.99, style: :currency            # => "€9.99"
nii.format Nii::Territory["MT"]              # => "Malta"
nii.format ["de", "fr", "it"], as: :language # => "Ġermaniż, Franċiż, u Taljan"
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
      <td><code>mt-MT</code></td>
      <td>Maltese (Malta)</td>
      <td><code>mt</code> and <code>mlt</code></td>
    </tr>
  </tbody>
</table>

