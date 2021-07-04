<!-- This file has been generated. Source: languages/_template.md.erb -->

# Dutch

## Installation

You do not need any additional libraries to use Dutch with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Dutch
nii = Nii::Context.new "nl" # => #<Nii::Context:nl-NL>

# Value formatting
nii.format 9.99, style: :currency            # => "€ 9,99"
nii.format Nii::Territory["NL"]              # => "Nederland"
nii.format ["de", "fr", "it"], as: :language # => "Duits, Frans en Italiaans"

# Spelling out numbers
nii.numbers.spellout 115            # => "honderdvijftien"
nii.numbers.spellout 1              # => "een"
nii.numbers.spellout 2020, :year    # => "twee­duizend­twintig"
nii.numbers.spellout 115,  :ordinal # => "honderd­vijftiende"
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
      <td><code>nl-AW</code></td>
      <td>Dutch (Aruba)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>nl-BE</code></td>
      <td>Flemish</td>
      <td></td>
    </tr>
    <tr>
      <td><code>nl-BQ</code></td>
      <td>Dutch (Caribbean Netherlands)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>nl-CW</code></td>
      <td>Dutch (Curaçao)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>nl-NL</code></td>
      <td>Dutch (Netherlands)</td>
      <td><code>nl</code>, <code>dut</code>, and <code>nld</code></td>
    </tr>
    <tr>
      <td><code>nl-SR</code></td>
      <td>Dutch (Suriname)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>nl-SX</code></td>
      <td>Dutch (Sint Maarten)</td>
      <td></td>
    </tr>
  </tbody>
</table>

