<!-- This file has been generated. Source: languages/_template.md.erb -->

# Spanish

## Installation

You do not need any additional libraries to use Spanish with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Spanish
nii = Nii::Context.new "es" # => #<Nii::Context:es-ES>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 €"
nii.format Nii::Territory["ES"]              # => "España"
nii.format ["de", "fr", "it"], as: :language # => "alemán, francés e italiano"

# Spelling out numbers
nii.spellout 115                                            # => "ciento quince"
nii.spellout 1                                              # => "uno"
nii.spellout 2020, rule: :year                              # => "dos mil veinte"
nii.spellout 1,    rule: :masculine                         # => "un"
nii.spellout 1,    rule: :feminine                          # => "una"
nii.spellout 1,    rule: [:ordinal, :masculine, :adjective] # => "primer"
nii.spellout 115,  rule: [:ordinal, :masculine, :plural]    # => "centésimo decimoquintos"
nii.spellout 115,  rule: [:ordinal, :masculine]             # => "centésimo decimoquinto"
nii.spellout 115,  rule: [:ordinal, :feminine, :plural]     # => "centésima decimoquintas"
nii.spellout 115,  rule: [:ordinal, :feminine]              # => "centésima decimoquinta"

# With RubyMoney
price = Money.eur 15_00
nii.format   price # => "15,00 €"
nii.spellout price # => "quince euros"
```

## Day Periods

### Spanish

<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Spanish</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>a. m.</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>p. m.</td>
      <td>12:00 to 24:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>tarde</td>
      <td>12:00 to 20:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>madrugada</td>
      <td>00:00 to 06:00</td>
    </tr>
    <tr>
      <td>morning2</td>
      <td>morning</td>
      <td>mañana</td>
      <td>06:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>noche</td>
      <td>20:00 to 24:00</td>
    </tr>
    <tr>
      <td>noon</td>
      <td>noon</td>
      <td>mediodía</td>
      <td>at 12:00</td>
    </tr>
  </tbody>
</table>

### Spanish (Colombia)

<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Spanish</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>a. m.</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>p. m.</td>
      <td>12:00 to 24:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>tarde</td>
      <td>12:00 to 20:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>madrugada</td>
      <td>00:00 to 06:00</td>
    </tr>
    <tr>
      <td>morning2</td>
      <td>morning</td>
      <td>mañana</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>noche</td>
      <td>20:00 to 24:00</td>
    </tr>
    <tr>
      <td>noon</td>
      <td>noon</td>
      <td>mediodía</td>
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
      <td><code>spanglis</code></td>
      <td>Spanglish</td>
      <td>A variety of contact dialects of English and Spanish</td>
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
      <td><code>es-419</code></td>
      <td>Latin American Spanish</td>
      <td></td>
    </tr>
    <tr>
      <td><code>es-AR</code></td>
      <td>Spanish (Argentina)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>es-BO</code></td>
      <td>Spanish (Bolivia)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>es-BR</code></td>
      <td>Spanish (Brazil)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>es-BZ</code></td>
      <td>Spanish (Belize)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>es-CL</code></td>
      <td>Spanish (Chile)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>es-CO</code></td>
      <td>Spanish (Colombia)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>es-CR</code></td>
      <td>Spanish (Costa Rica)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>es-CU</code></td>
      <td>Spanish (Cuba)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>es-DO</code></td>
      <td>Spanish (Dominican Republic)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>es-EA</code></td>
      <td>Spanish (Ceuta &amp; Melilla)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>es-EC</code></td>
      <td>Spanish (Ecuador)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>es-ES</code></td>
      <td>European Spanish</td>
      <td><code>es</code> and <code>spa</code></td>
    </tr>
    <tr>
      <td><code>es-GQ</code></td>
      <td>Spanish (Equatorial Guinea)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>es-GT</code></td>
      <td>Spanish (Guatemala)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>es-HN</code></td>
      <td>Spanish (Honduras)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>es-IC</code></td>
      <td>Spanish (Canary Islands)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>es-MX</code></td>
      <td>Mexican Spanish</td>
      <td></td>
    </tr>
    <tr>
      <td><code>es-NI</code></td>
      <td>Spanish (Nicaragua)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>es-PA</code></td>
      <td>Spanish (Panama)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>es-PE</code></td>
      <td>Spanish (Peru)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>es-PH</code></td>
      <td>Spanish (Philippines)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>es-PR</code></td>
      <td>Spanish (Puerto Rico)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>es-PY</code></td>
      <td>Spanish (Paraguay)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>es-SV</code></td>
      <td>Spanish (El Salvador)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>es-US</code></td>
      <td>Spanish (United States)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>es-UY</code></td>
      <td>Spanish (Uruguay)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>es-VE</code></td>
      <td>Spanish (Venezuela)</td>
      <td></td>
    </tr>
  </tbody>
</table>

