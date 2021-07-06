<!-- This file has been generated. Source: languages/_template.md.erb -->

# Vietnamese

## Installation

You do not need any additional libraries to use Vietnamese with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Vietnamese
nii = Nii::Context.new "vi" # => #<Nii::Context:vi-VN>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 ₫"
nii.format Nii::Territory["VN"]              # => "Việt Nam"
nii.format ["de", "fr", "it"], as: :language # => "Tiếng Đức, Tiếng Pháp và Tiếng Italy"

# Spelling out numbers
nii.spellout 115                  # => "một trăm mười lăm"
nii.spellout 1                    # => "một"
nii.spellout 2020, rule: :year    # => "hai nghìn không trăm hai mươi"
nii.spellout 115,  rule: :ordinal # => "thứ một trăm mười lăm"

# With RubyMoney
price = Money.eur 15_00
nii.format   price # => "15,00 €"
nii.spellout price # => "mười lăm euro"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Vietnamese</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>SA</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>CH</td>
      <td>12:00 to 24:00</td>
    </tr>
    <tr>
      <td>afternoon1</td>
      <td>afternoon</td>
      <td>chiều</td>
      <td>12:00 to 18:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>tối</td>
      <td>18:00 to 21:00</td>
    </tr>
    <tr>
      <td>midnight</td>
      <td>midnight</td>
      <td>nửa đêm</td>
      <td>at 00:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>sáng</td>
      <td>04:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>đêm</td>
      <td>21:00 to 04:00</td>
    </tr>
    <tr>
      <td>noon</td>
      <td>noon</td>
      <td>trưa</td>
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
      <td><code>vi-VN</code></td>
      <td>Vietnamese (Vietnam)</td>
      <td><code>vi</code> and <code>vie</code></td>
    </tr>
  </tbody>
</table>

