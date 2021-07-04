<!-- This file has been generated. Source: languages/_template.md.erb -->

# Afrikaans

## Installation

You do not need any additional libraries to use Afrikaans with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Afrikaans
nii = Nii::Context.new "af" # => #<Nii::Context:af-ZA>

# Value formatting
nii.format 9.99, style: :currency            # => "R 9,99"
nii.format Nii::Territory["ZA"]              # => "Suid-Afrika"
nii.format ["de", "fr", "it"], as: :language # => "Duits, Frans en Italiaans"

# Spelling out numbers
nii.numbers.spellout 115            # => "honderd vyftien"
nii.numbers.spellout 1              # => "een"
nii.numbers.spellout 2020           # => "twee­duisend twintig"
nii.numbers.spellout 2020, :year    # => "twintig twintig"
nii.numbers.spellout 115,  :ordinal # => "een honderd vyftiende"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Afrikaans</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>vm.</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>nm.</td>
      <td>12:00 to 24:00</td>
    </tr>
    <tr>
      <td>afternoon1</td>
      <td>afternoon</td>
      <td>middag</td>
      <td>12:00 to 18:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>aand</td>
      <td>18:00 to 24:00</td>
    </tr>
    <tr>
      <td>midnight</td>
      <td>midnight</td>
      <td>middernag</td>
      <td>at 00:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>oggend</td>
      <td>05:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>nag</td>
      <td>00:00 to 05:00</td>
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
      <td><code>af-NA</code></td>
      <td>Afrikaans (Namibia)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>af-ZA</code></td>
      <td>Afrikaans (South Africa)</td>
      <td><code>af</code> and <code>afr</code></td>
    </tr>
  </tbody>
</table>

