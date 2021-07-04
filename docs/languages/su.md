<!-- This file has been generated. Source: languages/_template.md.erb -->

# Sundanese

## Installation

In order to use Sundanese with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Sundanese
nii = Nii::Context.new "su" # => #<Nii::Context:su-Latn-ID>

# Value formatting
nii.format 9.99, style: :currency            # => "Rp 9,99"
nii.format Nii::Territory["ID"]              # => "ID"
nii.format ["de", "fr", "it"], as: :language # => "Jérman, Prancis, sareng Italia"
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
      <td><code>su-Latn</code></td>
      <td>Sundanese (Latin)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>su-Latn-ID</code></td>
      <td>Sundanese (Latin, Indonesia)</td>
      <td><code>su</code> and <code>sun</code></td>
    </tr>
  </tbody>
</table>

