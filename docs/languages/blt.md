<!-- This file has been generated. Source: languages/_template.md.erb -->

# Unknown language (blt)

## Installation

In order to use Unknown language (blt) with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Unknown language (blt)
nii = Nii::Context.new "blt" # => #<Nii::Context:blt-001>

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
      <td>Name in Unknown language (blt)</td>
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
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>blt-Latn</code></td>
      <td>Unknown language (blt, Latin)</td>
    </tr>
  </tbody>
</table>

