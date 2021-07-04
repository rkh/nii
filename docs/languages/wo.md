<!-- This file has been generated. Source: languages/_template.md.erb -->

# Wolof

## Installation

In order to use Wolof with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Wolof
nii = Nii::Context.new "wo" # => #<Nii::Context:wo-SN>

# Value formatting
nii.format 9.99, style: :currency            # => "F CFA 9,99"
nii.format Nii::Territory["SN"]              # => "Senegaal"
nii.format ["de", "fr", "it"], as: :language # => "Almaa, Farañse, Italiye"
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
      <td><code>wo-SN</code></td>
      <td>Wolof (Senegal)</td>
      <td><code>wo</code> and <code>wol</code></td>
    </tr>
    <tr>
      <td><code>wo-Arab</code></td>
      <td>Wolof (Arabic)</td>
      <td></td>
    </tr>
  </tbody>
</table>

