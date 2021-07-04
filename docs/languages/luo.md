<!-- This file has been generated. Source: languages/_template.md.erb -->

# Luo

## Installation

In order to use Luo with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Luo
nii = Nii::Context.new "luo" # => #<Nii::Context:luo-KE>

# Value formatting
nii.format 9.99, style: :currency            # => "9.99 Ksh"
nii.format Nii::Territory["KE"]              # => "Kenya"
nii.format ["de", "fr", "it"], as: :language # => "Kijerumani, Kifaransa, Kiitaliano"
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
      <td><code>luo-KE</code></td>
      <td>Luo (Kenya)</td>
      <td><code>luo</code></td>
    </tr>
  </tbody>
</table>
