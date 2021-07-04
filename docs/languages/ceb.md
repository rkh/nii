<!-- This file has been generated. Source: languages/_template.md.erb -->

# Cebuano

## Installation

In order to use Cebuano with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Cebuano
nii = Nii::Context.new "ceb" # => #<Nii::Context:ceb-PH>

# Value formatting
nii.format 9.99, style: :currency            # => "₱9.99"
nii.format Nii::Territory["PH"]              # => "Pilipinas"
nii.format ["de", "fr", "it"], as: :language # => "Aleman, Pranses, ug Italiano"
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
      <td><code>ceb-PH</code></td>
      <td>Cebuano (Philippines)</td>
      <td><code>ceb</code></td>
    </tr>
  </tbody>
</table>

