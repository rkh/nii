<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Navajo

## Installation

In order to use Navajo with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Navajo
nii = Nii::Context.new "nv" # => #<Nii::Context:nv-001>

# Value formatting
nii.format 9.99, currency: "USD"             # => "US$ 9.99"
nii.format Nii::Territory["001"]             # => "001"
nii.format ["de", "fr", "it"], as: :language # => "de, fr, it"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Navajo</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>AM</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>PM</td>
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
      <td><code>nv</code></td>
      <td>Navajo</td>
      <td><code>i-navajo</code> and <code>nav</code></td>
    </tr>
  </tbody>
</table>

