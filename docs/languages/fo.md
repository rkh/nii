<!-- This file has been generated. Source: languages/_template.md.erb -->

# Faroese

## Installation

In order to use Faroese with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Faroese
nii = Nii::Context.new "fo" # => #<Nii::Context:fo-FO>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 kr"
nii.format Nii::Territory["FO"]              # => "Føroyar"
nii.format ["de", "fr", "it"], as: :language # => "týskt, franskt og italskt"

# Spelling out numbers
nii.spellout 115                 # => "eitt­hundrað­og­fímtan"
nii.spellout 1                   # => "ein"
nii.spellout 2020                # => "tvey tusin og tjúgo"
nii.spellout 2020, rule: :year   # => "tjúgo­hundrað­og­tjúgo"
nii.spellout 1,    rule: :neuter # => "eitt"

# With RubyMoney
price = Money.eur 15_00
nii.format   price # => "15,00 €"
nii.spellout price # => "fímtan evrur"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Faroese</td>
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
      <td><code>fo-DK</code></td>
      <td>Faroese (Denmark)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>fo-FO</code></td>
      <td>Faroese (Faroe Islands)</td>
      <td><code>fo</code> and <code>fao</code></td>
    </tr>
  </tbody>
</table>

