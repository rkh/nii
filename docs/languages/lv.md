<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Latvian

## Installation

You do not need any additional libraries to use Latvian with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Latvian
nii = Nii::Context.new "lv" # => #<Nii::Context:lv-LV>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 €"
nii.format Nii::Territory["LV"]              # => "Latvija"
nii.format ["de", "fr", "it"], as: :language # => "vācu, franču un itāļu"

# Spelling out numbers
nii.spellout 115                   # => "simt piecpadsmit"
nii.spellout 1                     # => "viens"
nii.spellout 2020, rule: :year     # => "divtūkstoš divdesmit"
nii.spellout 1,    rule: :feminine # => "viena"

# With RubyMoney
price = Money.eur 15_00
nii.format   price # => "15,00 €"
nii.spellout price # => "piecpadsmit eiro"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Latvian</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>priekšpusdiena</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>pēcpusdiena</td>
      <td>12:00 to 24:00</td>
    </tr>
    <tr>
      <td>afternoon1</td>
      <td>afternoon</td>
      <td>pēcpusdiena</td>
      <td>12:00 to 18:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>vakars</td>
      <td>18:00 to 23:00</td>
    </tr>
    <tr>
      <td>midnight</td>
      <td>midnight</td>
      <td>pusnakts</td>
      <td>at 00:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>rīts</td>
      <td>06:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>nakts</td>
      <td>23:00 to 06:00</td>
    </tr>
    <tr>
      <td>noon</td>
      <td>noon</td>
      <td>pusdienlaiks</td>
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
      <td><code>vecdruka</code></td>
      <td>Latvian orthography used before 1920s ("vecā druka")</td>
      <td>The subtag represents the old orthography of the Latvian language used during c. 1600s–1920s.</td>
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
      <td><code>lv-LV</code></td>
      <td>Latvian (Latvia)</td>
      <td><code>lv</code>, <code>lav</code>, and <code>lvs</code></td>
    </tr>
  </tbody>
</table>

