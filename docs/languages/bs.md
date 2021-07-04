<!-- This file has been generated. Source: languages/_template.md.erb -->

# Bosnian

## Installation

You do not need any additional libraries to use Bosnian with Nii.
However, you do need to install `nii-extra-locales` in order to use Bosnian (Cyrillic).
See the [list of locales](#locales) below.

## Example Usage

``` ruby
# Create a context for Bosnian
nii = Nii::Context.new "bs" # => #<Nii::Context:bs-Latn-BA>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 KM"
nii.format Nii::Territory["BA"]              # => "Bosna i Hercegovina"
nii.format ["de", "fr", "it"], as: :language # => "njemački, francuski i italijanski"
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
      <td><code>bs-Cyrl</code></td>
      <td><code>nii-extra-locales</code></td>
      <td>Bosnian (Cyrillic)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>bs-Cyrl-BA</code></td>
      <td><code>nii-core</code></td>
      <td>Bosnian (Cyrillic, Bosnia &amp; Herzegovina)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>bs-Latn</code></td>
      <td><code>nii-core</code></td>
      <td>Bosnian (Latin)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>bs-Latn-BA</code></td>
      <td><code>nii-core</code></td>
      <td>Bosnian (Latin, Bosnia &amp; Herzegovina)</td>
      <td><code>bs</code> and <code>bos</code></td>
    </tr>
  </tbody>
</table>

