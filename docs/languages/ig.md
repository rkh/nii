<!-- This file has been generated. Source: languages/_template.md.erb -->

# Igbo

## Installation

In order to use Igbo with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Igbo
nii = Nii::Context.new "ig" # => #<Nii::Context:ig-NG>

# Value formatting
nii.format 9.99, style: :currency            # => "₦9.99"
nii.format Nii::Territory["NG"]              # => "Naịjịrịa"
nii.format ["de", "fr", "it"], as: :language # => "Jamanị, Fụrenchị, na Italịanu"
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
      <td><code>ig-NG</code></td>
      <td>Igbo (Nigeria)</td>
      <td><code>ig</code> and <code>ibo</code></td>
    </tr>
  </tbody>
</table>

