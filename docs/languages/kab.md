<!-- This file has been generated. Source: languages/_template.md.erb -->

# Kabyle

## Installation

In order to use Kabyle with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Kabyle
nii = Nii::Context.new "kab" # => #<Nii::Context:kab-DZ>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 DA"
nii.format Nii::Territory["DZ"]              # => "Lezzayer"
nii.format ["de", "fr", "it"], as: :language # => "Talmant, Tafransist, Taṭalyanit"
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
      <td><code>kab-DZ</code></td>
      <td>Kabyle (Algeria)</td>
      <td><code>kab</code></td>
    </tr>
  </tbody>
</table>

