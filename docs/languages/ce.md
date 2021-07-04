<!-- This file has been generated. Source: languages/_template.md.erb -->

# Chechen

## Installation

In order to use Chechen with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Chechen
nii = Nii::Context.new "ce" # => #<Nii::Context:ce-RU>

# Value formatting
nii.format 9.99, style: :currency            # => "9.99 ₽"
nii.format Nii::Territory["RU"]              # => "Росси"
nii.format ["de", "fr", "it"], as: :language # => "немцойн, французийн, итальянийн"
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
      <td><code>ce-RU</code></td>
      <td>Chechen (Russia)</td>
      <td><code>ce</code> and <code>che</code></td>
    </tr>
  </tbody>
</table>

