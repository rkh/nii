<!-- This file has been generated. Source: languages/_template.md.erb -->

# Luxembourgish

## Installation

In order to use Luxembourgish with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Luxembourgish
nii = Nii::Context.new "lb" # => #<Nii::Context:lb-LU>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 €"
nii.format Nii::Territory["LU"]              # => "Lëtzebuerg"
nii.format ["de", "fr", "it"], as: :language # => "Däitsch, Franséisch a(n) Italienesch"

# Spelling out numbers
nii.spellout 115                                # => "­honnert­fofzéng"
nii.spellout 1                                  # => "eent"
nii.spellout 2020                               # => "zwee­dausend­zwanzeg"
nii.spellout 2020, rule: :year                  # => "zwanzeghonnertzwanzeg"
nii.spellout 1,    rule: :feminine              # => "eng"
nii.spellout 1,    rule: :neuter                # => "een"
nii.spellout 115,  rule: [:ordinal, :masculine] # => "­honnert­fofzéngten"
nii.spellout 115,  rule: [:ordinal, :feminine]  # => "­honnert­fofzéngter"
nii.spellout 115,  rule: [:ordinal, :neuter]    # => "­honnert­fofzéngt"

# With RubyMoney
price = Money.eur 15_00
nii.format   price # => "15,00 €"
nii.spellout price # => "fofzéng Euro"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Luxembourgish</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>moies</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>nomëttes</td>
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
      <td><code>lb-LU</code></td>
      <td>Luxembourgish (Luxembourg)</td>
      <td><code>lb</code>, <code>i-lux</code>, and <code>ltz</code></td>
    </tr>
  </tbody>
</table>

