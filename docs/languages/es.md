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
nii.numbers.spellout 1                                      # => "uno"
nii.numbers.spellout 115                                    # => "ciento quince"
nii.numbers.spellout 2020, :year                            # => "dos mil veinte"
nii.numbers.spellout 1,    :masculine                       # => "un"
nii.numbers.spellout 1,    :feminine                        # => "una"
nii.numbers.spellout 1,    :ordinal, :masculine, :adjective # => "primer"
nii.numbers.spellout 115,  :ordinal, :masculine, :adjective # => "centésimo decimoquinto"
nii.numbers.spellout 1,    :ordinal, :masculine, :plural    # => "primeros"
nii.numbers.spellout 115,  :ordinal, :masculine, :plural    # => "centésimo decimoquintos"
nii.numbers.spellout 1,    :ordinal, :masculine             # => "primero"
nii.numbers.spellout 115,  :ordinal, :masculine             # => "centésimo decimoquinto"
nii.numbers.spellout 1,    :ordinal, :feminine, :plural     # => "primeras"
nii.numbers.spellout 115,  :ordinal, :feminine, :plural     # => "centésima decimoquintas"
nii.numbers.spellout 1,    :ordinal, :feminine              # => "primera"
nii.numbers.spellout 115,  :ordinal, :feminine              # => "centésima decimoquinta"
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

