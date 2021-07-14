<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Urdu

## Installation

You do not need any additional libraries to use Urdu with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Urdu
nii = Nii::Context.new "ur" # => #<Nii::Context:ur-PK>

# Value formatting
nii.format 9.99, style: :currency            # => "Rs 9.99"
nii.format Nii::Territory["PK"]              # => "پاکستان"
nii.format ["de", "fr", "it"], as: :language # => "جرمن، فرانسیسی، اور اطالوی"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Urdu</td>
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
      <td>دوپہر</td>
      <td>12:00 to 16:00</td>
    </tr>
    <tr>
      <td>afternoon2</td>
      <td>afternoon</td>
      <td>سہ پہر</td>
      <td>16:00 to 18:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>شام</td>
      <td>18:00 to 20:00</td>
    </tr>
    <tr>
      <td>midnight</td>
      <td>midnight</td>
      <td>آدھی رات</td>
      <td>at 00:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>صبح</td>
      <td>04:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>رات</td>
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
      <td><code>ur-IN</code></td>
      <td>Urdu (India)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ur-PK</code></td>
      <td>Urdu (Pakistan)</td>
      <td><code>ur</code> and <code>urd</code></td>
    </tr>
  </tbody>
</table>

