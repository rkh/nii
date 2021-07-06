<!-- This file has been generated. Source: languages/_template.md.erb -->

# Welsh

## Installation

You do not need any additional libraries to use Welsh with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Welsh
nii = Nii::Context.new "cy" # => #<Nii::Context:cy-GB>

# Value formatting
nii.format 9.99, style: :currency            # => "£9.99"
nii.format Nii::Territory["GB"]              # => "Y Deyrnas Unedig"
nii.format ["de", "fr", "it"], as: :language # => "Almaeneg, Ffrangeg, a(c) Eidaleg"

# Spelling out numbers
nii.spellout 115                                           # => "un cant un deg pump"
nii.spellout 1                                             # => "un"
nii.spellout 2020, rule: :year                             # => "dau mil dau ddeg"
nii.spellout 115,  rule: [:masculine, :before, :consonant] # => "un cant un deg pum"
nii.spellout 115,  rule: [:feminine, :before, :consonant]  # => "un cant un deg pum"

# With RubyMoney
price = Money.eur 15_00
nii.format   price # => "€15.00"
nii.spellout price # => "un deg pump ewro"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Welsh</td>
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
      <td>y prynhawn</td>
      <td>12:00 to 18:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>yr hwyr</td>
      <td>18:00 to 24:00</td>
    </tr>
    <tr>
      <td>midnight</td>
      <td>midnight</td>
      <td>canol nos</td>
      <td>at 00:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>y bore</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>noon</td>
      <td>noon</td>
      <td>canol dydd</td>
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
      <td><code>cy-GB</code></td>
      <td>Welsh (United Kingdom)</td>
      <td><code>cy</code>, <code>cym</code>, and <code>wel</code></td>
    </tr>
  </tbody>
</table>

