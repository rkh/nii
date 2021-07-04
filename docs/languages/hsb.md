<!-- This file has been generated. Source: languages/_template.md.erb -->

# Upper Sorbian

## Installation

In order to use Upper Sorbian with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Upper Sorbian
nii = Nii::Context.new "hsb" # => #<Nii::Context:hsb-DE>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 €"
nii.format Nii::Territory["DE"]              # => "Němska"
nii.format ["de", "fr", "it"], as: :language # => "němčina, francošćina a italšćina"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Upper Sorbian</td>
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
      <td>popołdnju</td>
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
      <td><code>hsb-DE</code></td>
      <td>Upper Sorbian (Germany)</td>
      <td><code>hsb</code></td>
    </tr>
  </tbody>
</table>

