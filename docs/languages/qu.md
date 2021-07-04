<!-- This file has been generated. Source: languages/_template.md.erb -->

# Quechua

## Installation

In order to use Quechua with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Quechua
nii = Nii::Context.new "qu" # => #<Nii::Context:qu-PE>

# Value formatting
nii.format 9.99, style: :currency            # => "S/ 9.99"
nii.format Nii::Territory["PE"]              # => "Perú"
nii.format ["de", "fr", "it"], as: :language # => "Aleman Simi, Frances Simi, Italiano Simi"

# Spelling out numbers
nii.numbers.spellout 1              # => "huk"
nii.numbers.spellout 115            # => "huk pachak chunka phisqa-yuq"
nii.numbers.spellout 2020, :year    # => "iskay waranqa iskay chunka"
nii.numbers.spellout 1,    :ordinal # => "huk-ñiqin"
nii.numbers.spellout 115,  :ordinal # => "huk pachak chunka phisqa-yuq-ñiqin"
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
      <td><code>qu-BO</code></td>
      <td>Quechua (Bolivia)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>qu-EC</code></td>
      <td>Quechua (Ecuador)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>qu-PE</code></td>
      <td>Quechua (Peru)</td>
      <td><code>qu</code>, <code>que</code>, and <code>quz</code></td>
    </tr>
  </tbody>
</table>
