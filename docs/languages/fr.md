<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# French

## Installation

You do not need any additional libraries to use French with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for French
nii = Nii::Context.new "fr" # => #<Nii::Context:fr-FR>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 €"
nii.format Nii::Territory["FR"]              # => "France"
nii.format ["de", "fr", "it"], as: :language # => "allemand, français et italien"

# Spelling out numbers
nii.spellout 115                                         # => "cent quinze"
nii.spellout 1                                           # => "un"
nii.spellout 2020, rule: :year                           # => "deux mille vingt"
nii.spellout 1,    rule: :feminine                       # => "une"
nii.spellout 115,  rule: [:ordinal, :masculine, :plural] # => "cent quinzièmes"
nii.spellout 115,  rule: [:ordinal, :masculine]          # => "cent quinzième"
nii.spellout 115,  rule: [:ordinal, :feminine, :plural]  # => "cent quinzièmes"
nii.spellout 115,  rule: [:ordinal, :feminine]           # => "cent quinzième"

# With RubyMoney
price = Money.eur 15_00
nii.format   price # => "15,00 €"
nii.spellout price # => "quinze euros"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in French</td>
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
      <td>après-midi</td>
      <td>12:00 to 18:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>soir</td>
      <td>18:00 to 24:00</td>
    </tr>
    <tr>
      <td>midnight</td>
      <td>midnight</td>
      <td>minuit</td>
      <td>at 00:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>matin</td>
      <td>04:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>nuit</td>
      <td>00:00 to 04:00</td>
    </tr>
    <tr>
      <td>noon</td>
      <td>noon</td>
      <td>midi</td>
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
      <td><code>1694acad</code></td>
      <td>Early Modern French</td>
      <td>17th century French, as catalogued in the "Dictionnaire de l'académie françoise", 4eme ed. 1694; frequently includes elements of Middle French, as this is a transitional period</td>
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
      <td><code>fr-BE</code></td>
      <td>French (Belgium)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>fr-BF</code></td>
      <td>French (Burkina Faso)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>fr-BI</code></td>
      <td>French (Burundi)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>fr-BJ</code></td>
      <td>French (Benin)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>fr-BL</code></td>
      <td>French (St. Barthélemy)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>fr-CA</code></td>
      <td>Canadian French</td>
      <td></td>
    </tr>
    <tr>
      <td><code>fr-CD</code></td>
      <td>French (Congo - Kinshasa)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>fr-CF</code></td>
      <td>French (Central African Republic)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>fr-CG</code></td>
      <td>French (Congo - Brazzaville)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>fr-CH</code></td>
      <td>Swiss French</td>
      <td></td>
    </tr>
    <tr>
      <td><code>fr-CI</code></td>
      <td>French (Côte d’Ivoire)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>fr-CM</code></td>
      <td>French (Cameroon)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>fr-DJ</code></td>
      <td>French (Djibouti)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>fr-DZ</code></td>
      <td>French (Algeria)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>fr-FR</code></td>
      <td>French (France)</td>
      <td><code>fr</code>, <code>fra</code>, and <code>fre</code></td>
    </tr>
    <tr>
      <td><code>fr-GA</code></td>
      <td>French (Gabon)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>fr-GF</code></td>
      <td>French (French Guiana)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>fr-GN</code></td>
      <td>French (Guinea)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>fr-GP</code></td>
      <td>French (Guadeloupe)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>fr-GQ</code></td>
      <td>French (Equatorial Guinea)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>fr-HT</code></td>
      <td>French (Haiti)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>fr-KM</code></td>
      <td>French (Comoros)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>fr-LU</code></td>
      <td>French (Luxembourg)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>fr-MA</code></td>
      <td>French (Morocco)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>fr-MC</code></td>
      <td>French (Monaco)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>fr-MF</code></td>
      <td>French (St. Martin)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>fr-MG</code></td>
      <td>French (Madagascar)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>fr-ML</code></td>
      <td>French (Mali)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>fr-MQ</code></td>
      <td>French (Martinique)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>fr-MR</code></td>
      <td>French (Mauritania)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>fr-MU</code></td>
      <td>French (Mauritius)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>fr-NC</code></td>
      <td>French (New Caledonia)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>fr-NE</code></td>
      <td>French (Niger)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>fr-PF</code></td>
      <td>French (French Polynesia)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>fr-PM</code></td>
      <td>French (St. Pierre &amp; Miquelon)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>fr-RE</code></td>
      <td>French (Réunion)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>fr-RW</code></td>
      <td>French (Rwanda)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>fr-SC</code></td>
      <td>French (Seychelles)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>fr-SN</code></td>
      <td>French (Senegal)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>fr-SY</code></td>
      <td>French (Syria)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>fr-TD</code></td>
      <td>French (Chad)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>fr-TG</code></td>
      <td>French (Togo)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>fr-TN</code></td>
      <td>French (Tunisia)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>fr-VU</code></td>
      <td>French (Vanuatu)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>fr-WF</code></td>
      <td>French (Wallis &amp; Futuna)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>fr-YT</code></td>
      <td>French (Mayotte)</td>
      <td></td>
    </tr>
  </tbody>
</table>

