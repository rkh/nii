<!-- This file has been generated. Source: languages/_template.md.erb -->

# Bodo

## Installation

In order to use Bodo with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Bodo
nii = Nii::Context.new "brx" # => #<Nii::Context:brx-IN>

# Value formatting
nii.format 9.99, style: :currency            # => "₹ 9.99"
nii.format Nii::Territory["IN"]              # => "भारत"
nii.format ["de", "fr", "it"], as: :language # => "ज़र्मन, फ्रांसीसी, ईटालियन्"
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
      <td><code>brx-IN</code></td>
      <td>Bodo (India)</td>
      <td><code>brx</code></td>
    </tr>
  </tbody>
</table>

