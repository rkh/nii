<!-- This file has been generated. Source: languages/_template.md.erb -->

# Italian

## Installation

You do not need any additional libraries to use Italian with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Italian
nii = Nii::Context.new "it" # => #<Nii::Context:it-IT>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 €"
nii.format Nii::Territory["IT"]              # => "Italia"
nii.format ["de", "fr", "it"], as: :language # => "tedesco, francese e italiano"

# Spelling out numbers
nii.numbers.spellout 115                        # => "cento­quindici"
nii.numbers.spellout 1                          # => "uno"
nii.numbers.spellout 2020, :year                # => "due­mila­venti"
nii.numbers.spellout 1,    :masculine           # => "un"
nii.numbers.spellout 1,    :feminine            # => "una"
nii.numbers.spellout 115,  :ordinal, :masculine # => "cento­quindicesimo"
nii.numbers.spellout 115,  :ordinal, :feminine  # => "cento­quindicesima"
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
      <td><code>it-CH</code></td>
      <td>Italian (Switzerland)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>it-IT</code></td>
      <td>Italian (Italy)</td>
      <td><code>it</code> and <code>ita</code></td>
    </tr>
    <tr>
      <td><code>it-SM</code></td>
      <td>Italian (San Marino)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>it-VA</code></td>
      <td>Italian (Vatican City)</td>
      <td></td>
    </tr>
  </tbody>
</table>

