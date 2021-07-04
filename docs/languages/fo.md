<!-- This file has been generated. Source: languages/_template.md.erb -->

# Faroese

## Installation

In order to use Faroese with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Faroese
nii = Nii::Context.new "fo" # => #<Nii::Context:fo-FO>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 kr"
nii.format Nii::Territory["FO"]              # => "Føroyar"
nii.format ["de", "fr", "it"], as: :language # => "týskt, franskt og italskt"
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
      <td><code>fo-DK</code></td>
      <td>Faroese (Denmark)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>fo-FO</code></td>
      <td>Faroese (Faroe Islands)</td>
      <td><code>fo</code> and <code>fao</code></td>
    </tr>
  </tbody>
</table>

