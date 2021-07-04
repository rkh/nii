<!-- This file has been generated. Source: languages/_template.md.erb -->

# Khmer

## Installation

You do not need any additional libraries to use Khmer with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Khmer
nii = Nii::Context.new "km" # => #<Nii::Context:km-KH>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99៛"
nii.format Nii::Territory["KH"]              # => "កម្ពុជា"
nii.format ["de", "fr", "it"], as: :language # => "អាល្លឺម៉ង់, បារាំង និង អ៊ីតាលី"

# Spelling out numbers
nii.numbers.spellout 115            # => "មួយ​រយ​ដប់​ប្រាំ"
nii.numbers.spellout 1              # => "មួយ"
nii.numbers.spellout 2020, :year    # => "ពីរ​ពាន់​ម្ភៃ"
nii.numbers.spellout 115,  :ordinal # => "ទីមួយ​រយ​ដប់​ប្រាំ"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Khmer</td>
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
      <td>រសៀល</td>
      <td>12:00 to 18:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>ល្ងាច</td>
      <td>18:00 to 21:00</td>
    </tr>
    <tr>
      <td>midnight</td>
      <td>midnight</td>
      <td>អធ្រាត្រ</td>
      <td>at 00:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>ព្រឹក</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>យប់</td>
      <td>21:00 to 24:00</td>
    </tr>
    <tr>
      <td>noon</td>
      <td>noon</td>
      <td>ថ្ងៃ​ត្រង់</td>
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
      <td><code>km-KH</code></td>
      <td>Khmer (Cambodia)</td>
      <td><code>km</code> and <code>khm</code></td>
    </tr>
  </tbody>
</table>

