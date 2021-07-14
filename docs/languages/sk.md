<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Slovak

## Installation

You do not need any additional libraries to use Slovak with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Slovak
nii = Nii::Context.new "sk" # => #<Nii::Context:sk-SK>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 €"
nii.format Nii::Territory["SK"]              # => "Slovensko"
nii.format ["de", "fr", "it"], as: :language # => "nemčina, francúzština a taliančina"

# Spelling out numbers
nii.spellout 115                   # => "jedna­sto pätnásť"
nii.spellout 1                     # => "jeden"
nii.spellout 2020, rule: :year     # => "dve tisíc dvadsať"
nii.spellout 1,    rule: :neuter   # => "jedno"
nii.spellout 1,    rule: :feminine # => "jedna"

# With RubyMoney
price = Money.eur 15_00
nii.format   price # => "15,00 €"
nii.spellout price # => "pätnásť eur"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Slovak</td>
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
      <td>popoludnie</td>
      <td>12:00 to 18:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>večer</td>
      <td>18:00 to 22:00</td>
    </tr>
    <tr>
      <td>midnight</td>
      <td>midnight</td>
      <td>polnoc</td>
      <td>at 00:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>ráno</td>
      <td>04:00 to 09:00</td>
    </tr>
    <tr>
      <td>morning2</td>
      <td>morning</td>
      <td>dopoludnie</td>
      <td>09:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>noc</td>
      <td>22:00 to 04:00</td>
    </tr>
    <tr>
      <td>noon</td>
      <td>noon</td>
      <td>poludnie</td>
      <td>at 12:00</td>
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
      <td><code>sk-SK</code></td>
      <td>Slovak (Slovakia)</td>
      <td><code>sk</code>, <code>slk</code>, and <code>slo</code></td>
    </tr>
  </tbody>
</table>

