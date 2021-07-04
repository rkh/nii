<!-- This file has been generated. Source: languages/_template.md.erb -->

# Ngiemboon

## Installation

In order to use Ngiemboon with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Ngiemboon
nii = Nii::Context.new "nnh" # => #<Nii::Context:nnh-CM>

# Value formatting
nii.format 9.99, style: :currency            # => "FCFA 9,99"
nii.format Nii::Territory["CM"]              # => "Kàmalûm"
nii.format ["de", "fr", "it"], as: :language # => "nzǎmɔ̂ɔn, felaŋsée, it"
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
      <td><code>nnh-CM</code></td>
      <td>Ngiemboon (Cameroon)</td>
      <td><code>nnh</code></td>
    </tr>
  </tbody>
</table>

