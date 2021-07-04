<!-- This file has been generated. Source: languages/_template.md.erb -->

# Czech

## Installation

You do not need any additional libraries to use Czech with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Czech
nii = Nii::Context.new "cs" # => #<Nii::Context:cs-CZ>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 Kč"
nii.format Nii::Territory["CZ"]              # => "Česko"
nii.format ["de", "fr", "it"], as: :language # => "němčina, francouzština a italština"

# Spelling out numbers
nii.numbers.spellout 1               # => "jeden"
nii.numbers.spellout 115             # => "sto patnáct"
nii.numbers.spellout 2020, :year     # => "dvě tisíce dvacet"
nii.numbers.spellout 1,    :neuter   # => "jedno"
nii.numbers.spellout 1,    :feminine # => "jedna"
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
      <td><code>cs-CZ</code></td>
      <td>Czech (Czechia)</td>
      <td><code>cs</code>, <code>ces</code>, and <code>cze</code></td>
    </tr>
  </tbody>
</table>

