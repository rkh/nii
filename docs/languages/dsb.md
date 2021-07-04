<!-- This file has been generated. Source: languages/_template.md.erb -->

# Lower Sorbian

## Installation

In order to use Lower Sorbian with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Lower Sorbian
nii = Nii::Context.new "dsb" # => #<Nii::Context:dsb-DE>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 €"
nii.format Nii::Territory["DE"]              # => "Nimska"
nii.format ["de", "fr", "it"], as: :language # => "nimšćina, francojšćina a italšćina"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Lower Sorbian</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>dopołdnja</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>wótpołdnja</td>
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
      <td><code>dsb-DE</code></td>
      <td>Lower Sorbian (Germany)</td>
      <td><code>dsb</code></td>
    </tr>
  </tbody>
</table>

