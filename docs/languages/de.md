<!-- This file has been generated. Source: languages/_template.md.erb -->

# German

## Installation

You do not need any additional libraries to use German with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for German
nii = Nii::Context.new "de" # => #<Nii::Context:de-DE>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 €"
nii.format Nii::Territory["DE"]              # => "Deutschland"
nii.format ["de", "fr", "it"], as: :language # => "Deutsch, Französisch und Italienisch"

# Spelling out numbers
nii.spellout 115                        # => "ein­hundert­fünfzehn"
nii.spellout 1                          # => "eins"
nii.spellout 2020, rule: :year          # => "zwei­tausend­zwanzig"
nii.spellout 1,    rule: :neuter        # => "ein"
nii.spellout 1,    rule: :masculine     # => "ein"
nii.spellout 1,    rule: :feminine      # => "eine"
nii.spellout 1,    rule: :n             # => "einen"
nii.spellout 1,    rule: :r             # => "einer"
nii.spellout 1,    rule: :s             # => "eines"
nii.spellout 1,    rule: :m             # => "einem"
nii.spellout 115,  rule: :ordinal       # => "ein­hundert­fünfzehnte"
nii.spellout 115,  rule: [:ordinal, :n] # => "ein­hundert­fünfzehnten"
nii.spellout 115,  rule: [:ordinal, :r] # => "ein­hundert­fünfzehnter"
nii.spellout 115,  rule: [:ordinal, :s] # => "ein­hundert­fünfzehntes"
nii.spellout 115,  rule: [:ordinal, :m] # => "ein­hundert­fünfzehntem"

# With RubyMoney
price = Money.eur 15_00
nii.format   price # => "15,00 €"
nii.spellout price # => "fünfzehn Euro"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in German</td>
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
      <td>Mittag</td>
      <td>12:00 to 13:00</td>
    </tr>
    <tr>
      <td>afternoon2</td>
      <td>afternoon</td>
      <td>Nachmittag</td>
      <td>13:00 to 18:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>Abend</td>
      <td>18:00 to 24:00</td>
    </tr>
    <tr>
      <td>midnight</td>
      <td>midnight</td>
      <td>Mitternacht</td>
      <td>at 00:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>Morgen</td>
      <td>05:00 to 10:00</td>
    </tr>
    <tr>
      <td>morning2</td>
      <td>morning</td>
      <td>Vormittag</td>
      <td>10:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>Nacht</td>
      <td>00:00 to 05:00</td>
    </tr>
  </tbody>
</table>


## Variants

<table>
  <thead>
    <tr>
      <th>Subtag</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>1901</code></td>
      <td>Traditional German orthography</td>
    </tr>
    <tr>
      <td><code>1996</code></td>
      <td>German orthography of 1996</td>
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
      <td><code>de-AT</code></td>
      <td>Austrian German</td>
      <td></td>
    </tr>
    <tr>
      <td><code>de-BE</code></td>
      <td>German (Belgium)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>de-CH</code></td>
      <td>Swiss High German</td>
      <td></td>
    </tr>
    <tr>
      <td><code>de-DE</code></td>
      <td>German (Germany)</td>
      <td><code>de</code>, <code>deu</code>, and <code>ger</code></td>
    </tr>
    <tr>
      <td><code>de-IT</code></td>
      <td>German (Italy)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>de-LI</code></td>
      <td>German (Liechtenstein)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>de-LU</code></td>
      <td>German (Luxembourg)</td>
      <td></td>
    </tr>
  </tbody>
</table>

