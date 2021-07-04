<!-- This file has been generated. Source: languages/_template.md.erb -->

# Hausa

## Installation

In order to use Hausa with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Hausa
nii = Nii::Context.new "ha" # => #<Nii::Context:ha-NG>

# Value formatting
nii.format 9.99, style: :currency            # => "₦ 9.99"
nii.format Nii::Territory["NG"]              # => "Najeriya"
nii.format ["de", "fr", "it"], as: :language # => "Jamusanci, Faransanci, da Italiyanci"
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
      <td><code>ha-GH</code></td>
      <td>Hausa (Ghana)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ha-NE</code></td>
      <td>Hausa (Niger)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ha-NG</code></td>
      <td>Hausa (Nigeria)</td>
      <td><code>ha</code> and <code>hau</code></td>
    </tr>
    <tr>
      <td><code>ha-Arab</code></td>
      <td>Hausa (Arabic)</td>
      <td></td>
    </tr>
  </tbody>
</table>

