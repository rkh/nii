<!-- This file has been generated. Source: languages/_template.md.erb -->

# Standard Moroccan Tamazight

## Installation

In order to use Standard Moroccan Tamazight with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Standard Moroccan Tamazight
nii = Nii::Context.new "zgh" # => #<Nii::Context:zgh-MA>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 MAD"
nii.format Nii::Territory["MA"]              # => "ⵍⵎⵖⵔⵉⴱ"
nii.format ["de", "fr", "it"], as: :language # => "ⵜⴰⵍⵉⵎⴰⵏⵜ, ⵜⴰⴼⵔⴰⵏⵙⵉⵙⵜ, ⵜⴰⵟⴰⵍⵢⴰⵏⵜ"
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
      <td><code>zgh-MA</code></td>
      <td>Standard Moroccan Tamazight (Morocco)</td>
      <td><code>zgh</code></td>
    </tr>
  </tbody>
</table>

