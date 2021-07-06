<!-- This file has been generated. Source: languages/_template.md.erb -->

# Dutch

## Installation

You do not need any additional libraries to use Dutch with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Dutch
nii = Nii::Context.new "nl" # => #<Nii::Context:nl-NL>

# Value formatting
nii.format 9.99, style: :currency            # => "€ 9,99"
nii.format Nii::Territory["NL"]              # => "Nederland"
nii.format ["de", "fr", "it"], as: :language # => "Duits, Frans en Italiaans"

# Spelling out numbers
nii.spellout 115                  # => "honderdvijftien"
nii.spellout 1                    # => "een"
nii.spellout 2020, rule: :year    # => "twee­duizend­twintig"
nii.spellout 115,  rule: :ordinal # => "honderd­vijftiende"

# With RubyMoney
price = Money.eur 15_00
nii.format   price # => "€ 15,00"
nii.spellout price # => "vijftien euro"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Dutch</td>
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
      <td>middag</td>
      <td>12:00 to 18:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>avond</td>
      <td>18:00 to 24:00</td>
    </tr>
    <tr>
      <td>midnight</td>
      <td>midnight</td>
      <td>middernacht</td>
      <td>at 00:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>ochtend</td>
      <td>06:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>nacht</td>
      <td>00:00 to 06:00</td>
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
      <td><code>nl-AW</code></td>
      <td>Dutch (Aruba)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>nl-BE</code></td>
      <td>Flemish</td>
      <td></td>
    </tr>
    <tr>
      <td><code>nl-BQ</code></td>
      <td>Dutch (Caribbean Netherlands)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>nl-CW</code></td>
      <td>Dutch (Curaçao)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>nl-NL</code></td>
      <td>Dutch (Netherlands)</td>
      <td><code>nl</code>, <code>dut</code>, and <code>nld</code></td>
    </tr>
    <tr>
      <td><code>nl-SR</code></td>
      <td>Dutch (Suriname)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>nl-SX</code></td>
      <td>Dutch (Sint Maarten)</td>
      <td></td>
    </tr>
  </tbody>
</table>

