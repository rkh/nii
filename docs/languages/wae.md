<!-- This file has been generated. Source: languages/_template.md.erb -->

# Walser

## Installation

In order to use Walser with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Walser
nii = Nii::Context.new "wae" # => #<Nii::Context:wae-CH>

# Value formatting
nii.format 9.99, style: :currency            # => "CHF 9,99"
nii.format Nii::Territory["CH"]              # => "Schwiz"
nii.format ["de", "fr", "it"], as: :language # => "Titš, Wälš und Italieniš"
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
      <td><code>wae-CH</code></td>
      <td>Walser (Switzerland)</td>
      <td><code>wae</code></td>
    </tr>
  </tbody>
</table>

