<!-- This file has been generated. Source: languages/_template.md.erb -->

# Lithuanian

## Installation

You do not need any additional libraries to use Lithuanian with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Lithuanian
nii = Nii::Context.new "lt" # => #<Nii::Context:lt-LT>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 €"
nii.format Nii::Territory["LT"]              # => "Lietuva"
nii.format ["de", "fr", "it"], as: :language # => "vokiečių, prancūzų ir italų"

# Spelling out numbers
nii.spellout 115                   # => "šimtas penkiolika"
nii.spellout 1                     # => "vienas"
nii.spellout 2020, rule: :year     # => "du tūkstančiai dvidešimt"
nii.spellout 1,    rule: :feminine # => "viena"

# With RubyMoney
price = Money.eur 15_00
nii.format   price # => "15,00 €"
nii.spellout price # => "penkiolika eurų"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Lithuanian</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>priešpiet</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>popiet</td>
      <td>12:00 to 24:00</td>
    </tr>
    <tr>
      <td>afternoon1</td>
      <td>afternoon</td>
      <td>diena</td>
      <td>12:00 to 18:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>vakaras</td>
      <td>18:00 to 24:00</td>
    </tr>
    <tr>
      <td>midnight</td>
      <td>midnight</td>
      <td>vidurnaktis</td>
      <td>at 00:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>rytas</td>
      <td>06:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>naktis</td>
      <td>00:00 to 06:00</td>
    </tr>
    <tr>
      <td>noon</td>
      <td>noon</td>
      <td>vidurdienis</td>
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
      <td><code>lt-LT</code></td>
      <td>Lithuanian (Lithuania)</td>
      <td><code>lt</code> and <code>lit</code></td>
    </tr>
  </tbody>
</table>

