<!-- This file has been generated. Source: languages/_template.md.erb -->

# Meru

## Installation

In order to use Meru with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Meru
nii = Nii::Context.new "mer" # => #<Nii::Context:mer-KE>

# Value formatting
nii.format 9.99, style: :currency            # => "Ksh 9.99"
nii.format Nii::Territory["KE"]              # => "Kenya"
nii.format ["de", "fr", "it"], as: :language # => "Kĩnjamanĩ, Kĩfuransi, Kĩitalĩ"
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
      <td><code>mer-KE</code></td>
      <td>Meru (Kenya)</td>
      <td><code>mer</code></td>
    </tr>
  </tbody>
</table>

