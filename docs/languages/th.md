<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Thai

## Installation

You do not need any additional libraries to use Thai with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Thai
nii = Nii::Context.new "th" # => #<Nii::Context:th-TH>

# Value formatting
nii.format 9.99, style: :currency            # => "฿9.99"
nii.format Nii::Territory["TH"]              # => "ไทย"
nii.format ["de", "fr", "it"], as: :language # => "เยอรมัน ฝรั่งเศส และอิตาลี"

# Spelling out numbers
nii.spellout 115                  # => "หนึ่ง​ร้อย​สิบ​ห้า"
nii.spellout 1                    # => "หนึ่ง"
nii.spellout 2020, rule: :year    # => "สอง​พัน​ยี่​สิบ"
nii.spellout 115,  rule: :ordinal # => "ที่​หนึ่ง​ร้อย​สิบ​ห้า"

# With RubyMoney
price = Money.eur 15_00
nii.format   price # => "€15.00"
nii.spellout price # => "สิบ​ห้า ยูโร"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Thai</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>ก่อนเที่ยง</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>หลังเที่ยง</td>
      <td>12:00 to 24:00</td>
    </tr>
    <tr>
      <td>afternoon1</td>
      <td>afternoon</td>
      <td>ในตอนบ่าย</td>
      <td>12:00 to 13:00</td>
    </tr>
    <tr>
      <td>afternoon2</td>
      <td>afternoon</td>
      <td>บ่าย</td>
      <td>13:00 to 16:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>ในตอนเย็น</td>
      <td>16:00 to 18:00</td>
    </tr>
    <tr>
      <td>evening2</td>
      <td>evening</td>
      <td>ค่ำ</td>
      <td>18:00 to 21:00</td>
    </tr>
    <tr>
      <td>midnight</td>
      <td>midnight</td>
      <td>เที่ยงคืน</td>
      <td>at 00:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>ในตอนเช้า</td>
      <td>06:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>กลางคืน</td>
      <td>21:00 to 06:00</td>
    </tr>
    <tr>
      <td>noon</td>
      <td>noon</td>
      <td>เที่ยง</td>
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
      <td><code>th-TH</code></td>
      <td>Thai (Thailand)</td>
      <td><code>th</code> and <code>tha</code></td>
    </tr>
  </tbody>
</table>

