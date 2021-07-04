<!-- This file has been generated. Source: languages/_template.md.erb -->

# Ewe

## Installation

In order to use Ewe with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Ewe
nii = Nii::Context.new "ee" # => #<Nii::Context:ee-GH>

# Value formatting
nii.format 9.99, style: :currency            # => "GH₵9.99"
nii.format Nii::Territory["GH"]              # => "Ghana nutome"
nii.format ["de", "fr", "it"], as: :language # => "Germaniagbe, Fransegbe, kple Italiagbe"

# Spelling out numbers
nii.numbers.spellout 115            # => "alafa ɖeka kple wuiatɔ̃"
nii.numbers.spellout 1              # => "ɖeka"
nii.numbers.spellout 2020, :year    # => "akpe eve kple blaeve"
nii.numbers.spellout 115,  :ordinal # => "alafa ɖeka kple wuiatɔ̃lia"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Ewe</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>ŋdi</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>ɣetrɔ</td>
      <td>12:00 to 24:00</td>
    </tr>
    <tr>
      <td>afternoon1</td>
      <td>afternoon</td>
      <td>ŋdɔ</td>
      <td>12:00 to 14:00</td>
    </tr>
    <tr>
      <td>afternoon2</td>
      <td>afternoon</td>
      <td>ɣetrɔ</td>
      <td>14:00 to 18:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>fiẽ</td>
      <td>18:00 to 21:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>fɔŋli</td>
      <td>04:00 to 05:00</td>
    </tr>
    <tr>
      <td>morning2</td>
      <td>morning</td>
      <td>ŋdi</td>
      <td>05:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>zã</td>
      <td>21:00 to 04:00</td>
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
      <td><code>ee-GH</code></td>
      <td>Ewe (Ghana)</td>
      <td><code>ee</code> and <code>ewe</code></td>
    </tr>
    <tr>
      <td><code>ee-TG</code></td>
      <td>Ewe (Togo)</td>
      <td></td>
    </tr>
  </tbody>
</table>

