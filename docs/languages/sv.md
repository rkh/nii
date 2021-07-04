<!-- This file has been generated. Source: languages/_template.md.erb -->

# Swedish

## Installation

You do not need any additional libraries to use Swedish with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Swedish
nii = Nii::Context.new "sv" # => #<Nii::Context:sv-SE>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 kr"
nii.format Nii::Territory["SE"]              # => "Sverige"
nii.format ["de", "fr", "it"], as: :language # => "tyska, franska och italienska"

# Spelling out numbers
nii.numbers.spellout 115                        # => "ett­hundra­femton"
nii.numbers.spellout 1                          # => "ett"
nii.numbers.spellout 2020                       # => "två­tusen tjugo"
nii.numbers.spellout 2020, :year                # => "tjugo­hundra­tjugo"
nii.numbers.spellout 1,    :masculine           # => "en"
nii.numbers.spellout 1,    :feminine            # => "en"
nii.numbers.spellout 1,    :reale               # => "en"
nii.numbers.spellout 115,  :ordinal, :neuter    # => "ett­hundra femtonde"
nii.numbers.spellout 115,  :ordinal, :masculine # => "ett­hundra femtonde"
nii.numbers.spellout 115,  :ordinal, :feminine  # => "ett­hundra femtonde"
nii.numbers.spellout 115,  :ordinal, :reale     # => "ett­hundra femtonde"
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
      <td><code>sv-AX</code></td>
      <td>Swedish (Åland Islands)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>sv-FI</code></td>
      <td>Swedish (Finland)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>sv-SE</code></td>
      <td>Swedish (Sweden)</td>
      <td><code>sv</code> and <code>swe</code></td>
    </tr>
  </tbody>
</table>

