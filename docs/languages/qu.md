<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Quechua

## Installation

In order to use Quechua with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Quechua
nii = Nii::Context.new "qu" # => #<Nii::Context:qu-PE>

# Value formatting
nii.format 9.99, style: :currency            # => "S/ 9.99"
nii.format Nii::Territory["PE"]              # => "Perú"
nii.format ["de", "fr", "it"], as: :language # => "Aleman Simi, Frances Simi, Italiano Simi"

# Spelling out numbers
nii.spellout 115                  # => "huk pachak chunka phisqa-yuq"
nii.spellout 1                    # => "huk"
nii.spellout 2020, rule: :year    # => "iskay waranqa iskay chunka"
nii.spellout 115,  rule: :ordinal # => "huk pachak chunka phisqa-yuq-ñiqin"

# With RubyMoney
price = Money.eur 15_00
nii.format   price # => "€ 15.00"
nii.spellout price # => "chunka phisqa-yuq euro"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Quechua</td>
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
      <td><code>qu-BO</code></td>
      <td>Quechua (Bolivia)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>qu-EC</code></td>
      <td>Quechua (Ecuador)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>qu-PE</code></td>
      <td>Quechua (Peru)</td>
      <td><code>qu</code>, <code>que</code>, and <code>quz</code></td>
    </tr>
  </tbody>
</table>

