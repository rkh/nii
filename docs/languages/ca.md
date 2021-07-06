<!-- This file has been generated. Source: languages/_template.md.erb -->

# Catalan

## Installation

You do not need any additional libraries to use Catalan with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Catalan
nii = Nii::Context.new "ca" # => #<Nii::Context:ca-ES>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 €"
nii.format Nii::Territory["ES"]              # => "Espanya"
nii.format ["de", "fr", "it"], as: :language # => "alemany, francès i italià"

# Spelling out numbers
nii.spellout 115                                # => "cent-quinze"
nii.spellout 1                                  # => "u"
nii.spellout 2020, rule: :year                  # => "dos mil vint"
nii.spellout 1,    rule: :masculine             # => "un"
nii.spellout 1,    rule: :feminine              # => "una"
nii.spellout 115,  rule: [:ordinal, :masculine] # => "cent-quinzè"
nii.spellout 115,  rule: [:ordinal, :feminine]  # => "cent-quinzena"

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
      <td>Name in Catalan</td>
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
      <td>afternoon1</td>
      <td>afternoon</td>
      <td>migdia</td>
      <td>12:00 to 13:00</td>
    </tr>
    <tr>
      <td>afternoon2</td>
      <td>afternoon</td>
      <td>tarda</td>
      <td>13:00 to 19:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>vespre</td>
      <td>19:00 to 21:00</td>
    </tr>
    <tr>
      <td>midnight</td>
      <td>midnight</td>
      <td>mitjanit</td>
      <td>at 00:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>matinada</td>
      <td>00:00 to 06:00</td>
    </tr>
    <tr>
      <td>morning2</td>
      <td>morning</td>
      <td>matí</td>
      <td>06:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>nit</td>
      <td>21:00 to 24:00</td>
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
      <td><code>valencia</code></td>
      <td>Valencian</td>
      <td>Variety spoken in the "Comunidad Valenciana" region of Spain, where it is co-official with Spanish.</td>
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
      <td><code>ca-AD</code></td>
      <td>Catalan (Andorra)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ca-ES</code></td>
      <td>Catalan (Spain)</td>
      <td><code>ca</code> and <code>cat</code></td>
    </tr>
    <tr>
      <td><code>ca-ES-valencia</code></td>
      <td>Catalan (Spain, Valencian)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ca-FR</code></td>
      <td>Catalan (France)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ca-IT</code></td>
      <td>Catalan (Italy)</td>
      <td></td>
    </tr>
  </tbody>
</table>

