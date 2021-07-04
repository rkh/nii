<!-- This file has been generated. Source: languages/_template.md.erb -->

# Galician

## Installation

You do not need any additional libraries to use Galician with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Galician
nii = Nii::Context.new "gl" # => #<Nii::Context:gl-ES>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 €"
nii.format Nii::Territory["ES"]              # => "España"
nii.format ["de", "fr", "it"], as: :language # => "alemán, francés e italiano"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Galician</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>a.m.</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>p.m.</td>
      <td>12:00 to 24:00</td>
    </tr>
    <tr>
      <td>afternoon1</td>
      <td>afternoon</td>
      <td>mediodía</td>
      <td>12:00 to 13:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>tarde</td>
      <td>13:00 to 21:00</td>
    </tr>
    <tr>
      <td>midnight</td>
      <td>midnight</td>
      <td>medianoite</td>
      <td>at 00:00</td>
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
      <td>mañá</td>
      <td>06:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>noite</td>
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
      <td><code>ao1990</code></td>
      <td>Portuguese Language Orthographic Agreement of 1990 (Acordo Ortográfico da Língua Portuguesa de 1990)</td>
      <td>Portuguese orthography conventions established in 1990 but not brought into effect until 2009</td>
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
      <td><code>gl-ES</code></td>
      <td>Galician (Spain)</td>
      <td><code>gl</code> and <code>glg</code></td>
    </tr>
  </tbody>
</table>

