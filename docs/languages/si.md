<!-- This file has been generated. Source: languages/_template.md.erb -->

# Sinhala

## Installation

You do not need any additional libraries to use Sinhala with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Sinhala
nii = Nii::Context.new "si" # => #<Nii::Context:si-LK>

# Value formatting
nii.format 9.99, style: :currency            # => "රු. 9.99"
nii.format Nii::Territory["LK"]              # => "ශ්‍රී ලංකාව"
nii.format ["de", "fr", "it"], as: :language # => "ජර්මන්, ප්‍රංශ, සහ ඉතාලි"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Sinhala</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>පෙ.ව.</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>ප.ව.</td>
      <td>12:00 to 24:00</td>
    </tr>
    <tr>
      <td>afternoon1</td>
      <td>afternoon</td>
      <td>දවල්</td>
      <td>12:00 to 14:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>හවස</td>
      <td>14:00 to 18:00</td>
    </tr>
    <tr>
      <td>midnight</td>
      <td>midnight</td>
      <td>මැදියම</td>
      <td>at 00:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>පාන්දර</td>
      <td>01:00 to 06:00</td>
    </tr>
    <tr>
      <td>morning2</td>
      <td>morning</td>
      <td>උදේ</td>
      <td>06:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>රෑ</td>
      <td>18:00 to 24:00</td>
    </tr>
    <tr>
      <td>night2</td>
      <td>night</td>
      <td>මැදියමට පසු</td>
      <td>00:00 to 01:00</td>
    </tr>
    <tr>
      <td>noon</td>
      <td>noon</td>
      <td>මධ්‍යාහ්නය</td>
      <td>at 12:00</td>
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
      <td><code>si-LK</code></td>
      <td>Sinhala (Sri Lanka)</td>
      <td><code>si</code> and <code>sin</code></td>
    </tr>
  </tbody>
</table>

