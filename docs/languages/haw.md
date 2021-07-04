<!-- This file has been generated. Source: languages/_template.md.erb -->

# Hawaiian

## Installation

In order to use Hawaiian with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Hawaiian
nii = Nii::Context.new "haw" # => #<Nii::Context:haw-US>

# Value formatting
nii.format 9.99, style: :currency            # => "$9.99"
nii.format Nii::Territory["US"]              # => "ʻAmelika Hui Pū ʻIa"
nii.format ["de", "fr", "it"], as: :language # => "Kelemānia, Palani, ʻĪkālia"
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
      <td><code>haw-US</code></td>
      <td>Hawaiian (United States)</td>
      <td><code>haw</code></td>
    </tr>
  </tbody>
</table>

