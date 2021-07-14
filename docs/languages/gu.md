<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Gujarati

## Installation

You do not need any additional libraries to use Gujarati with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Gujarati
nii = Nii::Context.new "gu" # => #<Nii::Context:gu-IN>

# Value formatting
nii.format 9.99, style: :currency            # => "₹9.99"
nii.format Nii::Territory["IN"]              # => "ભારત"
nii.format ["de", "fr", "it"], as: :language # => "જર્મન, ફ્રેન્ચ અને ઇટાલિયન"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Gujarati</td>
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
    <tr>
      <td>afternoon1</td>
      <td>afternoon</td>
      <td>બપોર</td>
      <td>12:00 to 16:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>સાંજ</td>
      <td>16:00 to 20:00</td>
    </tr>
    <tr>
      <td>midnight</td>
      <td>midnight</td>
      <td>મધ્યરાત્રિ</td>
      <td>at 00:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>સવાર</td>
      <td>04:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>રાત્રિ</td>
      <td>20:00 to 04:00</td>
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
      <td><code>gu-IN</code></td>
      <td>Gujarati (India)</td>
      <td><code>gu</code> and <code>guj</code></td>
    </tr>
  </tbody>
</table>

