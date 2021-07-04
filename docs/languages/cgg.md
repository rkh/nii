<!-- This file has been generated. Source: languages/_template.md.erb -->

# Chiga

## Installation

In order to use Chiga with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Chiga
nii = Nii::Context.new "cgg" # => #<Nii::Context:cgg-UG>

# Value formatting
nii.format 9.99, style: :currency            # => "USh 9.99"
nii.format Nii::Territory["UG"]              # => "Uganda"
nii.format ["de", "fr", "it"], as: :language # => "Orugirimaani, Orufaransa, Oruyitare"
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
      <td><code>cgg-UG</code></td>
      <td>Chiga (Uganda)</td>
      <td><code>cgg</code></td>
    </tr>
  </tbody>
</table>

