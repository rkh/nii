<!-- This file has been generated. Source: languages/_template.md.erb -->

# Teso

## Installation

In order to use Teso with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Teso
nii = Nii::Context.new "teo" # => #<Nii::Context:teo-UG>

# Value formatting
nii.format 9.99, style: :currency            # => "USh 9.99"
nii.format Nii::Territory["UG"]              # => "Uganda"
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
      <td><code>teo-KE</code></td>
      <td>Teso (Kenya)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>teo-UG</code></td>
      <td>Teso (Uganda)</td>
      <td><code>teo</code></td>
    </tr>
  </tbody>
</table>

