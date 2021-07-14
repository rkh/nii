<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

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
nii.spellout 115                                # => "сто пятнаццаць"
nii.spellout 1                                  # => "адзiн"
nii.spellout 2020, rule: :year                  # => "дзве  дваццаць"
nii.spellout 1,    rule: :neuter                # => "адно"
nii.spellout 1,    rule: :feminine              # => "адна"
nii.spellout 115,  rule: [:ordinal, :masculine] # => "сто пятнаццаты"
nii.spellout 115,  rule: [:ordinal, :feminine]  # => "сто пятнаццатая"
nii.spellout 115,  rule: [:ordinal, :neuter]    # => "сто пятнаццатае"

# With RubyMoney
price = Money.eur 15_00
nii.format   price # => "15,00 €"
nii.spellout price # => "пятнаццаць еўра"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Belarusian</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>AM</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>PM</td>
      <td>12:00 to 24:00</td>
    </tr>
  </tbody>
</table>


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

