<!-- This file has been generated. Source: languages/_template.md.erb -->

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
nii.numbers.spellout 1              # => "หนึ่ง"
nii.numbers.spellout 115            # => "หนึ่ง​ร้อย​สิบ​ห้า"
nii.numbers.spellout 2020, :year    # => "สอง​พัน​ยี่​สิบ"
nii.numbers.spellout 1,    :ordinal # => "ที่​หนึ่ง"
nii.numbers.spellout 115,  :ordinal # => "ที่​หนึ่ง​ร้อย​สิบ​ห้า"
```


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

