<!-- This file has been generated. Source: languages/_template.md.erb -->

# Vai

## Installation

In order to use Vai with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Vai
nii = Nii::Context.new "vai" # => #<Nii::Context:vai-Vaii-LR>

# Value formatting
nii.format 9.99, style: :currency            # => "$9.99"
nii.format Nii::Territory["LR"]              # => "ꕞꔤꔫꕩ"
nii.format ["de", "fr", "it"], as: :language # => "ꕧꕮꔧ, ꗱꘋꔻ, ꔤꕚꔷꘂꘋ"
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
      <td><code>vai-Latn</code></td>
      <td>Vai (Latin)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>vai-Latn-LR</code></td>
      <td>Vai (Latin, Liberia)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>vai-Vaii</code></td>
      <td>Vai (Vai)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>vai-Vaii-LR</code></td>
      <td>Vai (Vai, Liberia)</td>
      <td><code>vai</code></td>
    </tr>
  </tbody>
</table>

