<!-- This file has been generated. Source: languages/_template.md.erb -->

# Oromo

## Installation

In order to use Oromo with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Oromo
nii = Nii::Context.new "om" # => #<Nii::Context:om-ET>

# Value formatting
nii.format 9.99, style: :currency            # => "Br 9.99"
nii.format Nii::Territory["ET"]              # => "Itoophiyaa"
nii.format ["de", "fr", "it"], as: :language # => "Afaan Jarmanii, Afaan Faransaayii, Afaan Xaaliyaani"
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
      <td><code>om-ET</code></td>
      <td>Oromo (Ethiopia)</td>
      <td><code>om</code>, <code>gaz</code>, and <code>orm</code></td>
    </tr>
    <tr>
      <td><code>om-KE</code></td>
      <td>Oromo (Kenya)</td>
      <td></td>
    </tr>
  </tbody>
</table>

