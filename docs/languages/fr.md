<!-- This file has been generated. Source: languages/_template.md.erb -->

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
nii.numbers.spellout 1                                   # => "un"
nii.numbers.spellout 115                                 # => "cent quinze"
nii.numbers.spellout 2020, :year                         # => "deux mille vingt"
nii.numbers.spellout 1,    :feminine                     # => "une"
nii.numbers.spellout 1,    :ordinal, :masculine, :plural # => "premiers"
nii.numbers.spellout 115,  :ordinal, :masculine, :plural # => "cent quinzièmes"
nii.numbers.spellout 1,    :ordinal, :masculine          # => "premier"
nii.numbers.spellout 115,  :ordinal, :masculine          # => "cent quinzième"
nii.numbers.spellout 1,    :ordinal, :feminine, :plural  # => "premières"
nii.numbers.spellout 115,  :ordinal, :feminine, :plural  # => "cent quinzièmes"
nii.numbers.spellout 1,    :ordinal, :feminine           # => "première"
nii.numbers.spellout 115,  :ordinal, :feminine           # => "cent quinzième"
```

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
