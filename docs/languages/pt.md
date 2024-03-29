<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Portuguese

## Installation

You do not need any additional libraries to use Portuguese with Nii.
However, you do need to install `nii-extra-locales` in order to use Portuguese (France).
See the [list of locales](#locales) below.

## Example Usage

``` ruby
# Create a context for Portuguese
nii = Nii::Context.new "pt" # => #<Nii::Context:pt-BR>

# Value formatting
nii.format 9.99, style: :currency            # => "R$ 9,99"
nii.format Nii::Territory["BR"]              # => "Brasil"
nii.format ["de", "fr", "it"], as: :language # => "alemão, francês e italiano"

# Spelling out numbers
nii.spellout 115                                # => "cento e quinze"
nii.spellout 1                                  # => "um"
nii.spellout 2020, rule: :year                  # => "dois mil e vinte"
nii.spellout 1,    rule: :feminine              # => "uma"
nii.spellout 115,  rule: [:ordinal, :masculine] # => "centésimo décimo quinto"
nii.spellout 115,  rule: [:ordinal, :feminine]  # => "centésima décima quinta"

# With RubyMoney
price = Money.eur 15_00
nii.format   price # => "€ 15,00"
nii.spellout price # => "quinze Euros"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Portuguese</td>
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
      <td>tarde</td>
      <td>12:00 to 19:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>noite</td>
      <td>19:00 to 24:00</td>
    </tr>
    <tr>
      <td>midnight</td>
      <td>midnight</td>
      <td>meia-noite</td>
      <td>at 00:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>manhã</td>
      <td>06:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>madrugada</td>
      <td>00:00 to 06:00</td>
    </tr>
    <tr>
      <td>noon</td>
      <td>noon</td>
      <td>meio-dia</td>
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
      <td><code>ao1990</code></td>
      <td>Portuguese Language Orthographic Agreement of 1990 (Acordo Ortográfico da Língua Portuguesa de 1990)</td>
      <td>Portuguese orthography conventions established in 1990 but not brought into effect until 2009</td>
    </tr>
    <tr>
      <td><code>colb1945</code></td>
      <td>Portuguese-Brazilian Orthographic Convention of 1945 (Convenção Ortográfica Luso-Brasileira de 1945)</td>
      <td>Portuguese orthography conventions established in 1945, generally in effect until 2009. This reform was not ratified in Brazil.</td>
    </tr>
  </tbody>
</table>

## Locales

<table>
  <thead>
    <tr>
      <th>Locale Tag</th>
      <th>Library</th>
      <th>Description</th>
      <th>Aliases</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>pt-AO</code></td>
      <td><code>nii-core</code></td>
      <td>Portuguese (Angola)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>pt-BR</code></td>
      <td><code>nii-core</code></td>
      <td>Brazilian Portuguese</td>
      <td><code>pt</code> and <code>por</code></td>
    </tr>
    <tr>
      <td><code>pt-CH</code></td>
      <td><code>nii-core</code></td>
      <td>Portuguese (Switzerland)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>pt-CV</code></td>
      <td><code>nii-core</code></td>
      <td>Portuguese (Cape Verde)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>pt-GQ</code></td>
      <td><code>nii-core</code></td>
      <td>Portuguese (Equatorial Guinea)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>pt-GW</code></td>
      <td><code>nii-core</code></td>
      <td>Portuguese (Guinea-Bissau)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>pt-LU</code></td>
      <td><code>nii-core</code></td>
      <td>Portuguese (Luxembourg)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>pt-MO</code></td>
      <td><code>nii-core</code></td>
      <td>Portuguese (Macao SAR China)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>pt-MZ</code></td>
      <td><code>nii-core</code></td>
      <td>Portuguese (Mozambique)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>pt-PT</code></td>
      <td><code>nii-core</code></td>
      <td>European Portuguese</td>
      <td></td>
    </tr>
    <tr>
      <td><code>pt-ST</code></td>
      <td><code>nii-core</code></td>
      <td>Portuguese (São Tomé &amp; Príncipe)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>pt-TL</code></td>
      <td><code>nii-core</code></td>
      <td>Portuguese (Timor-Leste)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>pt-FR</code></td>
      <td><code>nii-extra-locales</code></td>
      <td>Portuguese (France)</td>
      <td></td>
    </tr>
  </tbody>
</table>

