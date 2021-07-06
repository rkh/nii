<!-- This file has been generated. Source: languages/_template.md.erb -->

# Sundanese

## Installation

In order to use Sundanese with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Sundanese
nii = Nii::Context.new "su" # => #<Nii::Context:su-Latn-ID>

# Value formatting
nii.format 9.99, style: :currency            # => "Rp 9,99"
nii.format Nii::Territory["ID"]              # => "ID"
nii.format ["de", "fr", "it"], as: :language # => "Jérman, Prancis, sareng Italia"

# Spelling out numbers
nii.spellout 115                  # => "hiji ratus lima belas"
nii.spellout 1                    # => "hiji"
nii.spellout 2020, rule: :year    # => "dua rebu dua puluh"
nii.spellout 115,  rule: :ordinal # => "kahiji ratus lima belas"

# With RubyMoney
price = Money.eur 15_00
nii.format   price # => "€15,00"
nii.spellout price # => "lima belas euro"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Sundanese</td>
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
      <td><code>su-Latn</code></td>
      <td>Sundanese (Latin)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>su-Latn-ID</code></td>
      <td>Sundanese (Latin, Indonesia)</td>
      <td><code>su</code> and <code>sun</code></td>
    </tr>
  </tbody>
</table>

