<!-- This file has been generated. Source: languages/_template.md.erb -->

# Polish

## Installation

You do not need any additional libraries to use Polish with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Polish
nii = Nii::Context.new "pl" # => #<Nii::Context:pl-PL>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 zł"
nii.format Nii::Territory["PL"]              # => "Polska"
nii.format ["de", "fr", "it"], as: :language # => "niemiecki, francuski i włoski"

# Spelling out numbers
nii.spellout 115                                              # => "sto piętnaście"
nii.spellout 1                                                # => "jeden"
nii.spellout 2020, rule: :year                                # => "dwa  dwadzieścia"
nii.spellout 115,  rule: [:masculine, :personal]              # => "stu piętnastu"
nii.spellout 1,    rule: :feminine                            # => "jedna"
nii.spellout 1,    rule: :neuter                              # => "jedno"
nii.spellout 115,  rule: [:masculine, :genitive]              # => "stu piętnastu"
nii.spellout 115,  rule: [:feminine, :genitive]               # => "stu piętnastu"
nii.spellout 115,  rule: [:neuter, :genitive]                 # => "stu piętnastu"
nii.spellout 115,  rule: [:masculine, :dative]                # => "stu piętnastu"
nii.spellout 115,  rule: [:feminine, :dative]                 # => "stu piętnastu"
nii.spellout 115,  rule: [:neuter, :dative]                   # => "stu piętnastu"
nii.spellout 1,    rule: [:masculine, :accusative, :animate]  # => "jednego"
nii.spellout 115,  rule: [:masculine, :accusative, :personal] # => "stu piętnastu"
nii.spellout 1,    rule: [:feminine, :accusative]             # => "jedną"
nii.spellout 115,  rule: [:masculine, :instrumental]          # => "stu piętnastoma"
nii.spellout 115,  rule: [:feminine, :instrumental]           # => "stu piętnastoma"
nii.spellout 115,  rule: [:neuter, :instrumental]             # => "stu piętnastoma"
nii.spellout 115,  rule: [:masculine, :locative]              # => "stu piętnastu"
nii.spellout 115,  rule: [:feminine, :locative]               # => "stu piętnastu"
nii.spellout 115,  rule: [:neuter, :locative]                 # => "stu piętnastu"

# With RubyMoney
price = Money.eur 15_00
nii.format   price # => "15,00 €"
nii.spellout price # => "piętnaście euro"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Polish</td>
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
      <td>popołudnie</td>
      <td>12:00 to 18:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>wieczór</td>
      <td>18:00 to 21:00</td>
    </tr>
    <tr>
      <td>midnight</td>
      <td>midnight</td>
      <td>północ</td>
      <td>at 00:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>rano</td>
      <td>06:00 to 10:00</td>
    </tr>
    <tr>
      <td>morning2</td>
      <td>morning</td>
      <td>przedpołudnie</td>
      <td>10:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>noc</td>
      <td>21:00 to 06:00</td>
    </tr>
    <tr>
      <td>noon</td>
      <td>noon</td>
      <td>południe</td>
      <td>at 12:00</td>
    </tr>
  </tbody>
</table>


## Variants

<table>
  <thead>
    <tr>
      <th>Subtag</th>
      <th>Description</th>
      <th>Comments</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>kociewie</code></td>
      <td>The Kociewie dialect of Polish</td>
      <td>The dialect of Kociewie is spoken in the region around Starogard Gdański, Tczew and Świecie in northern Poland.</td>
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
      <td><code>pl-PL</code></td>
      <td>Polish (Poland)</td>
      <td><code>pl</code> and <code>pol</code></td>
    </tr>
  </tbody>
</table>

