<!-- This file has been generated. Source: languages/_template.md.erb -->

# Turkish

## Installation

You do not need any additional libraries to use Turkish with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Turkish
nii = Nii::Context.new "tr" # => #<Nii::Context:tr-TR>

# Value formatting
nii.format 9.99, style: :currency            # => "₺9,99"
nii.format Nii::Territory["TR"]              # => "Türkiye"
nii.format ["de", "fr", "it"], as: :language # => "Almanca, Fransızca ve İtalyanca"

# Spelling out numbers
nii.spellout 115                  # => "yüz on beş"
nii.spellout 1                    # => "bir"
nii.spellout 2020, rule: :year    # => "iki bin yirmi"
nii.spellout 115,  rule: :ordinal # => "yüz on beşinci"

# With RubyMoney
price = Money.eur 15_00
nii.format   price # => "€15,00"
nii.spellout price # => "on beş Euro"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Turkish</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>ÖÖ</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>ÖS</td>
      <td>12:00 to 24:00</td>
    </tr>
    <tr>
      <td>afternoon1</td>
      <td>afternoon</td>
      <td>öğleden sonra</td>
      <td>12:00 to 18:00</td>
    </tr>
    <tr>
      <td>afternoon2</td>
      <td>afternoon</td>
      <td>akşamüstü</td>
      <td>18:00 to 19:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>akşam</td>
      <td>19:00 to 21:00</td>
    </tr>
    <tr>
      <td>midnight</td>
      <td>midnight</td>
      <td>gece yarısı</td>
      <td>at 00:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>sabah</td>
      <td>06:00 to 11:00</td>
    </tr>
    <tr>
      <td>morning2</td>
      <td>morning</td>
      <td>öğleden önce</td>
      <td>11:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>gece</td>
      <td>21:00 to 06:00</td>
    </tr>
    <tr>
      <td>noon</td>
      <td>noon</td>
      <td>öğle</td>
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
      <td><code>tr-CY</code></td>
      <td>Turkish (Cyprus)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>tr-TR</code></td>
      <td>Turkish (Turkey)</td>
      <td><code>tr</code> and <code>tur</code></td>
    </tr>
  </tbody>
</table>

