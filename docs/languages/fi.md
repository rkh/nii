<!-- This file has been generated. Source: languages/_template.md.erb -->

# Finnish

## Installation

You do not need any additional libraries to use Finnish with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Finnish
nii = Nii::Context.new "fi" # => #<Nii::Context:fi-FI>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 €"
nii.format Nii::Territory["FI"]              # => "Suomi"
nii.format ["de", "fr", "it"], as: :language # => "saksa, ranska ja italia"
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
      <td><code>fi-FI</code></td>
      <td>Finnish (Finland)</td>
      <td><code>fi</code> and <code>fin</code></td>
    </tr>
  </tbody>
</table>

