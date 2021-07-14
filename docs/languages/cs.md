<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Czech

## Installation

You do not need any additional libraries to use Czech with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Czech
nii = Nii::Context.new "cs" # => #<Nii::Context:cs-CZ>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 Kč"
nii.format Nii::Territory["CZ"]              # => "Česko"
nii.format ["de", "fr", "it"], as: :language # => "němčina, francouzština a italština"

# Spelling out numbers
nii.spellout 115                   # => "sto patnáct"
nii.spellout 1                     # => "jeden"
nii.spellout 2020, rule: :year     # => "dvě tisíce dvacet"
nii.spellout 1,    rule: :neuter   # => "jedno"
nii.spellout 1,    rule: :feminine # => "jedna"

# With RubyMoney
price = Money.eur 15_00
nii.format   price # => "15,00 €"
nii.spellout price # => "patnáct eur"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Czech</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>dop.</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>odp.</td>
      <td>12:00 to 24:00</td>
    </tr>
    <tr>
      <td>afternoon1</td>
      <td>afternoon</td>
      <td>odpoledne</td>
      <td>12:00 to 18:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>večer</td>
      <td>18:00 to 22:00</td>
    </tr>
    <tr>
      <td>midnight</td>
      <td>midnight</td>
      <td>půlnoc</td>
      <td>at 00:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>ráno</td>
      <td>04:00 to 09:00</td>
    </tr>
    <tr>
      <td>morning2</td>
      <td>morning</td>
      <td>dopoledne</td>
      <td>09:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>noc</td>
      <td>22:00 to 04:00</td>
    </tr>
    <tr>
      <td>noon</td>
      <td>noon</td>
      <td>poledne</td>
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
      <td><code>cs-CZ</code></td>
      <td>Czech (Czechia)</td>
      <td><code>cs</code>, <code>ces</code>, and <code>cze</code></td>
    </tr>
  </tbody>
</table>

