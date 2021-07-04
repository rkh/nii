<!-- This file has been generated. Source: languages/_template.md.erb -->

# Marathi

## Installation

You do not need any additional libraries to use Marathi with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Marathi
nii = Nii::Context.new "mr" # => #<Nii::Context:mr-IN>

# Value formatting
nii.format 9.99, style: :currency            # => "₹९.९९"
nii.format Nii::Territory["IN"]              # => "भारत"
nii.format ["de", "fr", "it"], as: :language # => "जर्मन, फ्रेंच आणि इटालियन"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Marathi</td>
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
      <td>दुपार</td>
      <td>12:00 to 16:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>संध्याकाळ</td>
      <td>16:00 to 18:00</td>
    </tr>
    <tr>
      <td>evening2</td>
      <td>evening</td>
      <td>सायंकाळ</td>
      <td>18:00 to 21:00</td>
    </tr>
    <tr>
      <td>midnight</td>
      <td>midnight</td>
      <td>मध्यरात्र</td>
      <td>at 00:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>पहाट</td>
      <td>04:00 to 06:00</td>
    </tr>
    <tr>
      <td>morning2</td>
      <td>morning</td>
      <td>सकाळ</td>
      <td>06:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>रात्र</td>
      <td>21:00 to 04:00</td>
    </tr>
    <tr>
      <td>noon</td>
      <td>noon</td>
      <td>मध्यान्ह</td>
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
      <td><code>mr-IN</code></td>
      <td>Marathi (India)</td>
      <td><code>mr</code> and <code>mar</code></td>
    </tr>
  </tbody>
</table>

