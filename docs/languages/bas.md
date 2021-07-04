<!-- This file has been generated. Source: languages/_template.md.erb -->

# Basaa

## Installation

In order to use Basaa with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Basaa
nii = Nii::Context.new "bas" # => #<Nii::Context:bas-CM>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 FCFA"
nii.format Nii::Territory["CM"]              # => "Kàmɛ̀rûn"
nii.format ["de", "fr", "it"], as: :language # => "Hɔp u jamân, Hɔp u pulàsi, Hɔp u italìà"
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
      <td><code>bas-CM</code></td>
      <td>Basaa (Cameroon)</td>
      <td><code>bas</code></td>
    </tr>
  </tbody>
</table>

