<!-- This file has been generated. Source: languages/_template.md.erb -->

# Lakota

## Installation

In order to use Lakota with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Lakota
nii = Nii::Context.new "lkt" # => #<Nii::Context:lkt-US>

# Value formatting
nii.format 9.99, style: :currency            # => "$ 9.99"
nii.format Nii::Territory["US"]              # => "Mílahaŋska Tȟamákȟočhe"
nii.format ["de", "fr", "it"], as: :language # => "Iyášiča Iyápi, Wašíču Ikčéka Iyápi, Italia Iyápi"
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
      <td><code>lkt-US</code></td>
      <td>Lakota (United States)</td>
      <td><code>lkt</code></td>
    </tr>
  </tbody>
</table>

