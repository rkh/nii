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
nii.numbers.spellout 115                          # => "­honnert­fofzéng"
nii.numbers.spellout 1                            # => "eent"
nii.numbers.spellout 2020                         # => "zwee­dausend­zwanzeg"
nii.numbers.spellout 2020, :year                  # => "zwanzeghonnertzwanzeg"
nii.numbers.spellout 1,    :feminine              # => "eng"
nii.numbers.spellout 1,    :neuter                # => "een"
nii.numbers.spellout 115,  :ordinal,   :masculine # => "­honnert­fofzéngten"
nii.numbers.spellout 115,  :ordinal,   :feminine  # => "­honnert­fofzéngter"
nii.numbers.spellout 115,  :ordinal,   :neuter    # => "­honnert­fofzéngt"
```


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

