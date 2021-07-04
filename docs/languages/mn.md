<!-- This file has been generated. Source: languages/_template.md.erb -->

# Mongolian

## Installation

You do not need any additional libraries to use Mongolian with Nii.
However, you do need to install `nii-extra-locales` in order to use Mongolian (Mongolian).
See the [list of locales](#locales) below.

## Example Usage

``` ruby
# Create a context for Mongolian
nii = Nii::Context.new "mn" # => #<Nii::Context:mn-MN>

# Value formatting
nii.format 9.99, style: :currency            # => "₮ 9.99"
nii.format Nii::Territory["MN"]              # => "Монгол"
nii.format ["de", "fr", "it"], as: :language # => "герман, франц, итали"
```


## Locales

<table>
  <thead>
    <tr>
      <th>Locale Tag</th>
      <th>Library</th>
      <th>Description</th>
      <th>Aliases</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>mn-MN</code></td>
      <td><code>nii-core</code></td>
      <td>Mongolian (Mongolia)</td>
      <td><code>mn</code>, <code>drh</code>, <code>khk</code>, and <code>mon</code></td>
    </tr>
    <tr>
      <td><code>mn-Mong</code></td>
      <td><code>nii-extra-locales</code></td>
      <td>Mongolian (Mongolian)</td>
      <td></td>
    </tr>
  </tbody>
</table>

