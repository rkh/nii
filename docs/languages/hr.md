<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Croatian

## Installation

You do not need any additional libraries to use Croatian with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Croatian
nii = Nii::Context.new "hr" # => #<Nii::Context:hr-HR>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 HRK"
nii.format Nii::Territory["HR"]              # => "Hrvatska"
nii.format ["de", "fr", "it"], as: :language # => "njemački, francuski i talijanski"

# Spelling out numbers
nii.spellout 115                                # => "sto petnaest"
nii.spellout 1                                  # => "jedan"
nii.spellout 2020, rule: :year                  # => "dvije tisuće dvadeset"
nii.spellout 1,    rule: :neuter                # => "jedno"
nii.spellout 1,    rule: :feminine              # => "jedna"
nii.spellout 115,  rule: [:ordinal, :masculine] # => "st petnaesti"
nii.spellout 115,  rule: [:ordinal, :neuter]    # => "st petnaesto"
nii.spellout 115,  rule: [:ordinal, :feminine]  # => "st petnaesta"

# With RubyMoney
price = Money.eur 15_00
nii.format   price # => "15,00 €"
nii.spellout price # => "petnaest eura"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Croatian</td>
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
      <td>popodne</td>
      <td>12:00 to 18:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>navečer</td>
      <td>18:00 to 21:00</td>
    </tr>
    <tr>
      <td>midnight</td>
      <td>midnight</td>
      <td>ponoć</td>
      <td>at 00:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>ujutro</td>
      <td>04:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>noću</td>
      <td>21:00 to 04:00</td>
    </tr>
    <tr>
      <td>noon</td>
      <td>noon</td>
      <td>podne</td>
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
      <td><code>hr-BA</code></td>
      <td>Croatian (Bosnia &amp; Herzegovina)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>hr-HR</code></td>
      <td>Croatian (Croatia)</td>
      <td><code>hr</code>, <code>hrv</code>, and <code>scr</code></td>
    </tr>
  </tbody>
</table>

