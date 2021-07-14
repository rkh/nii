<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Icelandic

## Installation

You do not need any additional libraries to use Icelandic with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Icelandic
nii = Nii::Context.new "is" # => #<Nii::Context:is-IS>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 ISK"
nii.format Nii::Territory["IS"]              # => "Ísland"
nii.format ["de", "fr", "it"], as: :language # => "þýska, franska og ítalska"

# Spelling out numbers
nii.spellout 115                   # => "eitt­hundrað og fimmtán"
nii.spellout 1                     # => "einn"
nii.spellout 2020                  # => "tvö þúsund og tuttugu"
nii.spellout 2020, rule: :year     # => "tuttugu hundrað og tuttugu"
nii.spellout 1,    rule: :neuter   # => "eitt"
nii.spellout 1,    rule: :feminine # => "ein"

# With RubyMoney
price = Money.eur 15_00
nii.format   price # => "15,00 €"
nii.spellout price # => "fimmtán evrur"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Icelandic</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>f.h.</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>e.h.</td>
      <td>12:00 to 24:00</td>
    </tr>
    <tr>
      <td>afternoon1</td>
      <td>afternoon</td>
      <td>eftir hádegi</td>
      <td>12:00 to 18:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>kvöld</td>
      <td>18:00 to 24:00</td>
    </tr>
    <tr>
      <td>midnight</td>
      <td>midnight</td>
      <td>miðnætti</td>
      <td>at 00:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>morgunn</td>
      <td>06:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>nótt</td>
      <td>00:00 to 06:00</td>
    </tr>
    <tr>
      <td>noon</td>
      <td>noon</td>
      <td>hádegi</td>
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
      <td><code>is-IS</code></td>
      <td>Icelandic (Iceland)</td>
      <td><code>is</code>, <code>ice</code>, and <code>isl</code></td>
    </tr>
  </tbody>
</table>

