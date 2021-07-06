<!-- This file has been generated. Source: languages/_template.md.erb -->

# Norwegian

## Installation

You do not need any additional libraries to use Norwegian with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Norwegian
nii = Nii::Context.new "no" # => #<Nii::Context:no-001>

# Value formatting
nii.format 9.99, currency: "USD"             # => "USD 9,99"
nii.format Nii::Territory["001"]             # => "verden"
nii.format ["de", "fr", "it"], as: :language # => "tysk, fransk og italiensk"

# Spelling out numbers
nii.spellout 115                                # => "hundre og femten"
nii.spellout 1                                  # => "én"
nii.spellout 2020                               # => "to tusen og tjue"
nii.spellout 2020, rule: :year                  # => "tjue­hundre og tjue"
nii.spellout 1,    rule: :feminine              # => "ei"
nii.spellout 1,    rule: :neuter                # => "ett"
nii.spellout 115,  rule: [:ordinal, :masculine] # => "én­hundre femtende"
nii.spellout 115,  rule: [:ordinal, :neuter]    # => "én­hundre femtende"
nii.spellout 115,  rule: [:ordinal, :feminine]  # => "én­hundre femtende"
nii.spellout 115,  rule: [:ordinal, :plural]    # => "én­hundre femtende"

# With RubyMoney
price = Money.eur 15_00
nii.format   price # => "€ 15,00"
nii.spellout price # => "femten euro"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Norwegian</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>a.m.</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>p.m.</td>
      <td>12:00 to 24:00</td>
    </tr>
    <tr>
      <td>afternoon1</td>
      <td>afternoon</td>
      <td>ettermiddag</td>
      <td>12:00 to 18:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>kveld</td>
      <td>18:00 to 24:00</td>
    </tr>
    <tr>
      <td>midnight</td>
      <td>midnight</td>
      <td>midnatt</td>
      <td>at 00:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>morgen</td>
      <td>06:00 to 10:00</td>
    </tr>
    <tr>
      <td>morning2</td>
      <td>morning</td>
      <td>formiddag</td>
      <td>10:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>natt</td>
      <td>00:00 to 06:00</td>
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
      <td><code>no</code></td>
      <td>Norwegian</td>
      <td><code>nor</code></td>
    </tr>
  </tbody>
</table>

