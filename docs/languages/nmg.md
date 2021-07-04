<!-- This file has been generated. Source: languages/_template.md.erb -->

# Kwasio

## Installation

In order to use Kwasio with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Kwasio
nii = Nii::Context.new "nmg" # => #<Nii::Context:nmg-CM>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 FCFA"
nii.format Nii::Territory["CM"]              # => "Kamerun"
nii.format ["de", "fr", "it"], as: :language # => "Jáman, Fala, Kiɛl italia"
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
      <td><code>nmg-CM</code></td>
      <td>Kwasio (Cameroon)</td>
      <td><code>nmg</code></td>
    </tr>
  </tbody>
</table>

