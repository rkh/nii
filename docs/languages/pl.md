<!-- This file has been generated. Source: languages/_template.md.erb -->

# Polish

## Installation

You do not need any additional libraries to use Polish with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Polish
nii = Nii::Context.new "pl" # => #<Nii::Context:pl-PL>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 zł"
nii.format Nii::Territory["PL"]              # => "Polska"
nii.format ["de", "fr", "it"], as: :language # => "niemiecki, francuski i włoski"

# Spelling out numbers
nii.numbers.spellout 1                                        # => "jeden"
nii.numbers.spellout 115                                      # => "sto piętnaście"
nii.numbers.spellout 2020, :year                              # => "dwa  dwadzieścia"
nii.numbers.spellout 115,  :masculine, :personal              # => "stu piętnastu"
nii.numbers.spellout 1,    :feminine                          # => "jedna"
nii.numbers.spellout 1,    :neuter                            # => "jedno"
nii.numbers.spellout 1,    :masculine, :genitive              # => "jednego"
nii.numbers.spellout 115,  :masculine, :genitive              # => "stu piętnastu"
nii.numbers.spellout 1,    :feminine, :genitive               # => "jednej"
nii.numbers.spellout 115,  :feminine, :genitive               # => "stu piętnastu"
nii.numbers.spellout 1,    :neuter, :genitive                 # => "jednego"
nii.numbers.spellout 115,  :neuter, :genitive                 # => "stu piętnastu"
nii.numbers.spellout 1,    :masculine, :dative                # => "jednemu"
nii.numbers.spellout 115,  :masculine, :dative                # => "stu piętnastu"
nii.numbers.spellout 1,    :feminine, :dative                 # => "jednej"
nii.numbers.spellout 115,  :feminine, :dative                 # => "stu piętnastu"
nii.numbers.spellout 1,    :neuter, :dative                   # => "jednemu"
nii.numbers.spellout 115,  :neuter, :dative                   # => "stu piętnastu"
nii.numbers.spellout 1,    :masculine, :accusative, :animate  # => "jednego"
nii.numbers.spellout 1,    :masculine, :accusative, :personal # => "jednego"
nii.numbers.spellout 115,  :masculine, :accusative, :personal # => "stu piętnastu"
nii.numbers.spellout 1,    :feminine, :accusative             # => "jedną"
nii.numbers.spellout 1,    :neuter, :accusative               # => "jedno"
nii.numbers.spellout 1,    :masculine, :instrumental          # => "jednym"
nii.numbers.spellout 115,  :masculine, :instrumental          # => "stu piętnastoma"
nii.numbers.spellout 1,    :feminine, :instrumental           # => "jedną"
nii.numbers.spellout 115,  :feminine, :instrumental           # => "stu piętnastoma"
nii.numbers.spellout 1,    :neuter, :instrumental             # => "jednym"
nii.numbers.spellout 115,  :neuter, :instrumental             # => "stu piętnastoma"
nii.numbers.spellout 1,    :masculine, :locative              # => "jednym"
nii.numbers.spellout 115,  :masculine, :locative              # => "stu piętnastu"
nii.numbers.spellout 1,    :feminine, :locative               # => "jednej"
nii.numbers.spellout 115,  :feminine, :locative               # => "stu piętnastu"
nii.numbers.spellout 1,    :neuter, :locative                 # => "jednym"
nii.numbers.spellout 115,  :neuter, :locative                 # => "stu piętnastu"
```

## Variants

<table>
  <thead>
    <tr>
      <th>Subtag</th>
      <th>Description</th>
      <th>Comments</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>kociewie</code></td>
      <td>The Kociewie dialect of Polish</td>
      <td>The dialect of Kociewie is spoken in the region around Starogard Gdański, Tczew and Świecie in northern Poland.</td>
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
      <td><code>pl-PL</code></td>
      <td>Polish (Poland)</td>
      <td><code>pl</code> and <code>pol</code></td>
    </tr>
  </tbody>
</table>

