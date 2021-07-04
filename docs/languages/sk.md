<!-- This file has been generated. Source: languages/_template.md.erb -->

# Slovak

## Installation

You do not need any additional libraries to use Slovak with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Slovak
nii = Nii::Context.new "sk" # => #<Nii::Context:sk-SK>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 €"
nii.format Nii::Territory["SK"]              # => "Slovensko"
nii.format ["de", "fr", "it"], as: :language # => "nemčina, francúzština a taliančina"
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
      <td><code>sk-SK</code></td>
      <td>Slovak (Slovakia)</td>
      <td><code>sk</code>, <code>slk</code>, and <code>slo</code></td>
    </tr>
  </tbody>
</table>

