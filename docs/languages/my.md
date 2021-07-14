<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Burmese

## Installation

You do not need any additional libraries to use Burmese with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Burmese
nii = Nii::Context.new "my" # => #<Nii::Context:my-MM>

# Value formatting
nii.format 9.99, style: :currency            # => "၉.၉၉ K"
nii.format Nii::Territory["MM"]              # => "မြန်မာ"
nii.format ["de", "fr", "it"], as: :language # => "ဂျာမန်၊ ပြင်သစ်နှင့် အီတလီ"

# Spelling out numbers
nii.spellout 115                  # => "တစ်ရာ့ဆယ့်ငါး"
nii.spellout 1                    # => "တစ်"
nii.spellout 2020, rule: :year    # => "နှစ်ထောင့်နှစ်ဆယ်"
nii.spellout 1,    rule: :ordinal # => "ပထမ"

# With RubyMoney
price = Money.eur 15_00
nii.format   price # => "၁၅.၀၀ €"
nii.spellout price # => "ယူရို ဆယ့်ငါး"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Burmese</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>နံနက်</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>ညနေ</td>
      <td>12:00 to 24:00</td>
    </tr>
    <tr>
      <td>afternoon1</td>
      <td>afternoon</td>
      <td>နေ့လယ်</td>
      <td>12:00 to 16:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>ညနေ</td>
      <td>16:00 to 19:00</td>
    </tr>
    <tr>
      <td>midnight</td>
      <td>midnight</td>
      <td>သန်းခေါင်ယံ</td>
      <td>at 00:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>နံနက်</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>ည</td>
      <td>19:00 to 24:00</td>
    </tr>
    <tr>
      <td>noon</td>
      <td>noon</td>
      <td>မွန်းတည့်</td>
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
      <td><code>my-MM</code></td>
      <td>Burmese (Myanmar (Burma))</td>
      <td><code>my</code>, <code>bur</code>, and <code>mya</code></td>
    </tr>
  </tbody>
</table>

