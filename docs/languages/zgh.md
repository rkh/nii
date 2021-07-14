<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

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

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Standard Moroccan Tamazight</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>ⵜⵉⴼⴰⵡⵜ</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>ⵜⴰⴷⴳⴳⵯⴰⵜ</td>
      <td>12:00 to 24:00</td>
    </tr>
  </tbody>
</table>



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

