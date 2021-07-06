<!-- This file has been generated. Source: languages/_template.md.erb -->

# Persian

## Installation

You do not need any additional libraries to use Persian with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Persian
nii = Nii::Context.new "fa" # => #<Nii::Context:fa-IR>

# Value formatting
nii.format 9.99, style: :currency            # => "‎ریال ۹٫۹۹"
nii.format Nii::Territory["IR"]              # => "ایران"
nii.format ["de", "fr", "it"], as: :language # => "آلمانی،‏ فرانسوی، و ایتالیایی"

# Spelling out numbers
nii.spellout 115               # => "صد و پانزده"
nii.spellout 1                 # => "یک"
nii.spellout 2020, rule: :year # => "دو هزار و بیست"

# With RubyMoney
price = Money.eur 15_00
nii.format   price # => "‎€۱۵٫۰۰"
nii.spellout price # => "پانزده یورو"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Persian</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>قبل‌ازظهر</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>بعدازظهر</td>
      <td>12:00 to 24:00</td>
    </tr>
    <tr>
      <td>afternoon1</td>
      <td>afternoon</td>
      <td>ظهر</td>
      <td>12:00 to 13:00</td>
    </tr>
    <tr>
      <td>afternoon2</td>
      <td>afternoon</td>
      <td>عصر</td>
      <td>13:00 to 19:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>بامداد</td>
      <td>01:00 to 04:00</td>
    </tr>
    <tr>
      <td>morning2</td>
      <td>morning</td>
      <td>صبح</td>
      <td>04:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>شب</td>
      <td>19:00 to 24:00</td>
    </tr>
    <tr>
      <td>night2</td>
      <td>night</td>
      <td>نیمه‌شب</td>
      <td>00:00 to 01:00</td>
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
      <td><code>fa-AF</code></td>
      <td>Dari</td>
      <td><code>drw</code>, <code>prs</code>, and <code>tnf</code></td>
    </tr>
    <tr>
      <td><code>fa-IR</code></td>
      <td>Persian (Iran)</td>
      <td><code>fa</code>, <code>fas</code>, <code>per</code>, and <code>pes</code></td>
    </tr>
  </tbody>
</table>

