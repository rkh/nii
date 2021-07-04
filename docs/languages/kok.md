<!-- This file has been generated. Source: languages/_template.md.erb -->

# Konkani

## Installation

In order to use Konkani with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Konkani
nii = Nii::Context.new "kok" # => #<Nii::Context:kok-IN>

# Value formatting
nii.format 9.99, style: :currency            # => "₹ 9.99"
nii.format Nii::Territory["IN"]              # => "भारत"
nii.format ["de", "fr", "it"], as: :language # => "जर्मन, फ्रेंच, इटालियन"
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
      <td><code>kok-IN</code></td>
      <td>Konkani (India)</td>
      <td><code>kok</code> and <code>knn</code></td>
    </tr>
  </tbody>
</table>

