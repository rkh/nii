<!-- This file has been generated. Source: languages/_template.md.erb -->

# Bangla

## Installation

You do not need any additional libraries to use Bangla with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Bangla
nii = Nii::Context.new "bn" # => #<Nii::Context:bn-BD>

# Value formatting
nii.format 9.99, style: :currency            # => "৯.৯৯৳"
nii.format Nii::Territory["BD"]              # => "বাংলাদেশ"
nii.format ["de", "fr", "it"], as: :language # => "জার্মান, ফরাসি এবং ইতালিয়"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Bangla</td>
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
      <td>দুপুর</td>
      <td>12:00 to 16:00</td>
    </tr>
    <tr>
      <td>afternoon2</td>
      <td>afternoon</td>
      <td>বিকাল</td>
      <td>16:00 to 18:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>সন্ধ্যা</td>
      <td>18:00 to 20:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>ভোর</td>
      <td>04:00 to 06:00</td>
    </tr>
    <tr>
      <td>morning2</td>
      <td>morning</td>
      <td>সকাল</td>
      <td>06:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>রাত্রি</td>
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
      <td><code>bn-BD</code></td>
      <td>Bangla (Bangladesh)</td>
      <td><code>bn</code> and <code>ben</code></td>
    </tr>
    <tr>
      <td><code>bn-IN</code></td>
      <td>Bangla (India)</td>
      <td></td>
    </tr>
  </tbody>
</table>

