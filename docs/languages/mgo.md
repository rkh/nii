<!-- This file has been generated. Source: languages/_template.md.erb -->

# Metaʼ

## Installation

In order to use Metaʼ with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Metaʼ
nii = Nii::Context.new "mgo" # => #<Nii::Context:mgo-CM>

# Value formatting
nii.format 9.99, style: :currency            # => "FCFA 9.99"
nii.format Nii::Territory["CM"]              # => "Kamalun"
nii.format ["de", "fr", "it"], as: :language # => "de, fr, it"
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
      <td><code>mgo-CM</code></td>
      <td>Metaʼ (Cameroon)</td>
      <td><code>mgo</code></td>
    </tr>
  </tbody>
</table>

