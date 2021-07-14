<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Filipino

## Installation

You do not need any additional libraries to use Filipino with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Filipino
nii = Nii::Context.new "fil" # => #<Nii::Context:fil-PH>

# Value formatting
nii.format 9.99, style: :currency            # => "₱9.99"
nii.format Nii::Territory["PH"]              # => "Pilipinas"
nii.format ["de", "fr", "it"], as: :language # => "German, French, at Italian"

# Spelling out numbers
nii.spellout 115                  # => "isáng daán at labíng-limá"
nii.spellout 1                    # => "isá"
nii.spellout 2020, rule: :year    # => "dalawáng libó’t dalawáng pû"
nii.spellout 115,  rule: :ordinal # => "ika isáng daán at labíng-limá"

# With RubyMoney
price = Money.eur 15_00
nii.format   price # => "€15.00"
nii.spellout price # => "labíng-limá euro"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Filipino</td>
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
      <td>tanghali</td>
      <td>12:00 to 16:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>hapon</td>
      <td>16:00 to 18:00</td>
    </tr>
    <tr>
      <td>midnight</td>
      <td>midnight</td>
      <td>hatinggabi</td>
      <td>at 00:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>umaga</td>
      <td>00:00 to 06:00</td>
    </tr>
    <tr>
      <td>morning2</td>
      <td>morning</td>
      <td>madaling-araw</td>
      <td>06:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>gabi</td>
      <td>18:00 to 24:00</td>
    </tr>
    <tr>
      <td>noon</td>
      <td>noon</td>
      <td>tanghaling-tapat</td>
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
      <td><code>fil-PH</code></td>
      <td>Filipino (Philippines)</td>
      <td><code>fil</code>, <code>tgl</code>, and <code>tl</code></td>
    </tr>
  </tbody>
</table>

