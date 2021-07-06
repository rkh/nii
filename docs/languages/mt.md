<!-- This file has been generated. Source: languages/_template.md.erb -->

# Maltese

## Installation

In order to use Maltese with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Maltese
nii = Nii::Context.new "mt" # => #<Nii::Context:mt-MT>

# Value formatting
nii.format 9.99, style: :currency            # => "€9.99"
nii.format Nii::Territory["MT"]              # => "Malta"
nii.format ["de", "fr", "it"], as: :language # => "Ġermaniż, Franċiż, u Taljan"

# Spelling out numbers
nii.spellout 115                    # => "mija u ħmistax"
nii.spellout 1                      # => "wieħed"
nii.spellout 2020, rule: :year      # => "elfejn u għoxrin"
nii.spellout 115,  rule: :masculine # => "mija u ħmistax-il"
nii.spellout 115,  rule: :feminine  # => "mija u ħmistax-il"

# With RubyMoney
price = Money.eur 15_00
nii.format   price # => "€15.00"
nii.spellout price # => "ħmistax ewro"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Maltese</td>
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
      <td><code>mt-MT</code></td>
      <td>Maltese (Malta)</td>
      <td><code>mt</code> and <code>mlt</code></td>
    </tr>
  </tbody>
</table>

