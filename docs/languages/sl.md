<!-- This file has been generated. Source: languages/_template.md.erb -->

# Slovenian

## Installation

You do not need any additional libraries to use Slovenian with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Slovenian
nii = Nii::Context.new "sl" # => #<Nii::Context:sl-SI>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 €"
nii.format Nii::Territory["SI"]              # => "Slovenija"
nii.format ["de", "fr", "it"], as: :language # => "nemščina, francoščina in italijanščina"

# Spelling out numbers
nii.spellout 115               # => "sto petnajst"
nii.spellout 1                 # => "ena"
nii.spellout 2020, rule: :year # => "dvije tisuće dvaset"

# With RubyMoney
price = Money.eur 15_00
nii.format   price # => "15,00 €"
nii.spellout price # => "petnajst evrov"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Slovenian</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>dopoldne</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>popoldne</td>
      <td>12:00 to 24:00</td>
    </tr>
    <tr>
      <td>afternoon1</td>
      <td>afternoon</td>
      <td>popoldne</td>
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
      <td>polnoč</td>
      <td>at 00:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>jutro</td>
      <td>06:00 to 10:00</td>
    </tr>
    <tr>
      <td>morning2</td>
      <td>morning</td>
      <td>dopoldne</td>
      <td>10:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>noč</td>
      <td>22:00 to 06:00</td>
    </tr>
    <tr>
      <td>noon</td>
      <td>noon</td>
      <td>poldne</td>
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
      <td><code>bohoric</code></td>
      <td>Slovene in Bohorič alphabet</td>
      <td>The subtag represents the alphabet codified by Adam Bohorič in 1584 and used from the first printed Slovene book and up to the mid-19th century.</td>
    </tr>
    <tr>
      <td><code>dajnko</code></td>
      <td>Slovene in Dajnko alphabet</td>
      <td>The subtag represents the alphabet codified by Peter Dajnko and used from 1824 to 1839 mostly in Styria (in what is now Eastern Slovenia).</td>
    </tr>
    <tr>
      <td><code>metelko</code></td>
      <td>Slovene in Metelko alphabet</td>
      <td>The subtag represents the alphabet codified by Franc Serafin Metelko and used from 1825 to 1833.</td>
    </tr>
    <tr>
      <td><code>nedis</code></td>
      <td>Natisone dialect / Nadiza dialect</td>
      <td></td>
    </tr>
    <tr>
      <td><code>rozaj</code></td>
      <td>Resian / Resianic / Rezijan</td>
      <td></td>
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
      <td><code>sl-SI</code></td>
      <td>Slovenian (Slovenia)</td>
      <td><code>sl</code> and <code>slv</code></td>
    </tr>
  </tbody>
</table>

