<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Interlingua

## Installation

In order to use Interlingua with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Interlingua
nii = Nii::Context.new "ia" # => #<Nii::Context:ia-001>

# Value formatting
nii.format 9.99, currency: "USD"             # => "US$ 9,99"
nii.format Nii::Territory["001"]             # => "Mundo"
nii.format ["de", "fr", "it"], as: :language # => "germano, francese e italiano"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Interlingua</td>
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
      <td><code>ia-001</code></td>
      <td>Interlingua (world)</td>
      <td><code>ia</code> and <code>ina</code></td>
    </tr>
  </tbody>
</table>

