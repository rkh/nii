<!-- This file has been generated. Source: languages/_template.md.erb -->

# Akan

## Installation

In order to use Akan with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Akan
nii = Nii::Context.new "ak" # => #<Nii::Context:ak-GH>

# Value formatting
nii.format 9.99, style: :currency            # => "GH₵9.99"
nii.format Nii::Territory["GH"]              # => "Gaana"
nii.format ["de", "fr", "it"], as: :language # => "Gyaaman, Frɛnkye, Italy kasa"

# Spelling out numbers
nii.spellout 115                  # => "­ɔha-na-­du-anum"
nii.spellout 1                    # => "koro"
nii.spellout 2020                 # => "mpem-abien-na-aduonu"
nii.spellout 2020, rule: :year    # => "abien abien hwee"
nii.spellout 115,  rule: :ordinal # => "a-ɛ-tɔ-so-­ɔha-na-­du-anum"

# With RubyMoney
price = Money.eur 15_00
nii.format   price # => "€15.00"
nii.spellout price # => "du-anum Iro"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Akan</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>AN</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>EW</td>
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
      <td><code>ak-GH</code></td>
      <td>Akan (Ghana)</td>
      <td><code>ak</code>, <code>aka</code>, <code>fat</code>, <code>tw</code>, and <code>twi</code></td>
    </tr>
  </tbody>
</table>

