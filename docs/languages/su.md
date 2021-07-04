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
nii.numbers.spellout 115            # => "hiji ratus lima belas"
nii.numbers.spellout 1              # => "hiji"
nii.numbers.spellout 2020, :year    # => "dua rebu dua puluh"
nii.numbers.spellout 115,  :ordinal # => "kahiji ratus lima belas"
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

