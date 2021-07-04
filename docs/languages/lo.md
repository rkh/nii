<!-- This file has been generated. Source: languages/_template.md.erb -->

# Lao

## Installation

You do not need any additional libraries to use Lao with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Lao
nii = Nii::Context.new "lo" # => #<Nii::Context:lo-LA>

# Value formatting
nii.format 9.99, style: :currency            # => "₭9,99"
nii.format Nii::Territory["LA"]              # => "ລາວ"
nii.format ["de", "fr", "it"], as: :language # => "ເຢຍລະມັນ, ຝຣັ່ງ, ອິຕາລຽນ"

# Spelling out numbers
nii.numbers.spellout 115            # => "ໜຶ່ງ​ร้อย​ສິບ​ຫ້າ"
nii.numbers.spellout 1              # => "ໜຶ່ງ"
nii.numbers.spellout 2020, :year    # => "ສອງ​พัน​ຊາວ"
nii.numbers.spellout 115,  :ordinal # => "ที่​ໜຶ່ງ​ร้อย​ສິບ​ຫ້າ"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Lao</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>ກ່ອນທ່ຽງ</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>ຫຼັງທ່ຽງ</td>
      <td>12:00 to 24:00</td>
    </tr>
    <tr>
      <td>afternoon1</td>
      <td>afternoon</td>
      <td>ສວຍ</td>
      <td>12:00 to 16:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>ແລງ</td>
      <td>16:00 to 20:00</td>
    </tr>
    <tr>
      <td>midnight</td>
      <td>midnight</td>
      <td>ທ່ຽງຄືນ</td>
      <td>at 00:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>​ເຊົ້າ</td>
      <td>05:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>​ກາງ​ຄືນ</td>
      <td>20:00 to 05:00</td>
    </tr>
    <tr>
      <td>noon</td>
      <td>noon</td>
      <td>ຕອນທ່ຽງ</td>
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
      <td><code>lo-LA</code></td>
      <td>Lao (Laos)</td>
      <td><code>lo</code> and <code>lao</code></td>
    </tr>
  </tbody>
</table>

