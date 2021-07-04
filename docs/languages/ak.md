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
nii.numbers.spellout 115            # => "­ɔha-na-­du-anum"
nii.numbers.spellout 1              # => "koro"
nii.numbers.spellout 2020           # => "mpem-abien-na-aduonu"
nii.numbers.spellout 2020, :year    # => "abien abien hwee"
nii.numbers.spellout 115,  :ordinal # => "a-ɛ-tɔ-so-­ɔha-na-­du-anum"
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

