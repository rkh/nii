<!-- This file has been generated. Source: languages/_template.md.erb -->

# Belarusian

## Installation

You do not need any additional libraries to use Belarusian with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Belarusian
nii = Nii::Context.new "be" # => #<Nii::Context:be-BY>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 Br"
nii.format Nii::Territory["BY"]              # => "Беларусь"
nii.format ["de", "fr", "it"], as: :language # => "нямецкая, французская і італьянская"

# Spelling out numbers
nii.numbers.spellout 1                          # => "адзiн"
nii.numbers.spellout 115                        # => "сто пятнаццаць"
nii.numbers.spellout 2020, :year                # => "дзве  дваццаць"
nii.numbers.spellout 1,    :neuter              # => "адно"
nii.numbers.spellout 1,    :feminine            # => "адна"
nii.numbers.spellout 1,    :ordinal, :masculine # => "першы"
nii.numbers.spellout 115,  :ordinal, :masculine # => "сто пятнаццаты"
nii.numbers.spellout 1,    :ordinal, :feminine  # => "першая"
nii.numbers.spellout 115,  :ordinal, :feminine  # => "сто пятнаццатая"
nii.numbers.spellout 1,    :ordinal, :neuter    # => "першае"
nii.numbers.spellout 115,  :ordinal, :neuter    # => "сто пятнаццатае"
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
      <td><code>1959acad</code></td>
      <td>"Academic" ("governmental") variant of Belarusian as codified in 1959</td>
      <td></td>
    </tr>
    <tr>
      <td><code>tarask</code></td>
      <td>Belarusian in Taraskievica orthography</td>
      <td>The subtag represents Branislau Taraskievic's Belarusian orthography as published in "Bielaruski klasycny pravapis" by Juras Buslakou, Vincuk Viacorka, Zmicier Sanko, and Zmicier Sauka (Vilnia- Miensk 2005).</td>
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
      <td><code>be-BY</code></td>
      <td>Belarusian (Belarus)</td>
      <td><code>be</code> and <code>bel</code></td>
    </tr>
  </tbody>
</table>
