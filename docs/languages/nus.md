<!-- This file has been generated. Source: languages/_template.md.erb -->

# Nuer

## Installation

In order to use Nuer with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Nuer
nii = Nii::Context.new "nus" # => #<Nii::Context:nus-SS>

# Value formatting
nii.format 9.99, style: :currency            # => "£9.99"
nii.format Nii::Territory["SS"]              # => "SS"
nii.format ["de", "fr", "it"], as: :language # => "Thok jarmani, Thok pɔrɔthani, Thok i̱taliani"
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
      <td><code>nus-SS</code></td>
      <td>Nuer (South Sudan)</td>
      <td><code>nus</code></td>
    </tr>
  </tbody>
</table>

