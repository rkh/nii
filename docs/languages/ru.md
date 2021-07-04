<!-- This file has been generated. Source: languages/_template.md.erb -->

# Russian

## Installation

You do not need any additional libraries to use Russian with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Russian
nii = Nii::Context.new "ru" # => #<Nii::Context:ru-RU>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 ₽"
nii.format Nii::Territory["RU"]              # => "Россия"
nii.format ["de", "fr", "it"], as: :language # => "немецкий, французский и итальянский"

# Spelling out numbers
nii.numbers.spellout 115                                    # => "сто пятнадцать"
nii.numbers.spellout 1                                      # => "один"
nii.numbers.spellout 2020                                   # => "две  двадцать"
nii.numbers.spellout 2020, :year                            # => "две тысячи двадцатого"
nii.numbers.spellout 1,    :neuter                          # => "одно"
nii.numbers.spellout 1,    :feminine                        # => "одна"
nii.numbers.spellout 1,    :plural                          # => "одни"
nii.numbers.spellout 115,  :masculine, :genitive            # => "ста пятнадцати"
nii.numbers.spellout 115,  :neuter, :genitive               # => "ста пятнадцати"
nii.numbers.spellout 115,  :feminine, :genitive             # => "ста пятнадцати"
nii.numbers.spellout 115,  :plural, :genitive               # => "ста пятнадцати"
nii.numbers.spellout 115,  :masculine, :dative              # => "ста пятнадцати"
nii.numbers.spellout 115,  :neuter, :dative                 # => "ста пятнадцати"
nii.numbers.spellout 115,  :feminine, :dative               # => "ста пятнадцати"
nii.numbers.spellout 115,  :plural, :dative                 # => "ста пятнадцати"
nii.numbers.spellout 1,    :feminine, :accusative           # => "одну"
nii.numbers.spellout 115,  :masculine, :locative            # => "ста пятнадцати"
nii.numbers.spellout 115,  :neuter, :locative               # => "ста пятнадцати"
nii.numbers.spellout 115,  :feminine, :locative             # => "ста пятнадцати"
nii.numbers.spellout 115,  :plural, :locative               # => "ста пятнадцати"
nii.numbers.spellout 115,  :masculine, :ablative            # => "ста пятнадцатью"
nii.numbers.spellout 115,  :neuter, :ablative               # => "ста пятнадцатью"
nii.numbers.spellout 115,  :feminine, :ablative             # => "ста пятнадцатью"
nii.numbers.spellout 115,  :plural, :ablative               # => "ста пятнадцатью"
nii.numbers.spellout 115,  :ordinal, :masculine             # => "сто пятнадцатый"
nii.numbers.spellout 115,  :ordinal, :neuter                # => "сто пятнадцатое"
nii.numbers.spellout 115,  :ordinal, :feminine              # => "сто пятнадцатая"
nii.numbers.spellout 115,  :ordinal, :plural                # => "сто пятнадцатые"
nii.numbers.spellout 115,  :ordinal, :masculine, :genitive  # => "сто пятнадцатого"
nii.numbers.spellout 115,  :ordinal, :neuter, :genitive     # => "сто пятнадцатого"
nii.numbers.spellout 115,  :ordinal, :feminine, :genitive   # => "сто пятнадцатой"
nii.numbers.spellout 115,  :ordinal, :plural, :genitive     # => "сто пятнадцатых"
nii.numbers.spellout 115,  :ordinal, :masculine, :dative    # => "сто пятнадцатому"
nii.numbers.spellout 115,  :ordinal, :neuter, :dative       # => "сто пятнадцатому"
nii.numbers.spellout 115,  :ordinal, :feminine, :dative     # => "сто пятнадцатой"
nii.numbers.spellout 115,  :ordinal, :plural, :dative       # => "сто пятнадцатым"
nii.numbers.spellout 115,  :ordinal, :feminine, :accusative # => "сто пятнадцатую"
nii.numbers.spellout 115,  :ordinal, :masculine, :locative  # => "сто пятнадцатом"
nii.numbers.spellout 115,  :ordinal, :neuter, :locative     # => "сто пятнадцатом"
nii.numbers.spellout 115,  :ordinal, :feminine, :locative   # => "сто пятнадцатой"
nii.numbers.spellout 115,  :ordinal, :plural, :locative     # => "сто пятнадцатых"
nii.numbers.spellout 115,  :ordinal, :masculine, :ablative  # => "сто пятнадцатым"
nii.numbers.spellout 115,  :ordinal, :neuter, :ablative     # => "сто пятнадцатым"
nii.numbers.spellout 115,  :ordinal, :feminine, :ablative   # => "сто пятнадцатой"
nii.numbers.spellout 115,  :ordinal, :plural, :ablative     # => "сто пятнадцатыми"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Russian</td>
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
    <tr>
      <td>afternoon1</td>
      <td>afternoon</td>
      <td>день</td>
      <td>12:00 to 18:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>вечер</td>
      <td>18:00 to 22:00</td>
    </tr>
    <tr>
      <td>midnight</td>
      <td>midnight</td>
      <td>полночь</td>
      <td>at 00:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>утро</td>
      <td>04:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>ночь</td>
      <td>22:00 to 04:00</td>
    </tr>
    <tr>
      <td>noon</td>
      <td>noon</td>
      <td>полдень</td>
      <td>at 12:00</td>
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
      <td><code>luna1918</code></td>
      <td>Post-1917 Russian orthography</td>
      <td>Russian orthography as established by the 1917/1918 orthographic reforms</td>
    </tr>
    <tr>
      <td><code>petr1708</code></td>
      <td>Petrine orthography</td>
      <td>Russian orthography from the Petrine orthographic reforms of 1708 to the 1917 orthographic reform</td>
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
      <td><code>ru-BY</code></td>
      <td>Russian (Belarus)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ru-KG</code></td>
      <td>Russian (Kyrgyzstan)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ru-KZ</code></td>
      <td>Russian (Kazakhstan)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ru-MD</code></td>
      <td>Russian (Moldova)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ru-RU</code></td>
      <td>Russian (Russia)</td>
      <td><code>ru</code> and <code>rus</code></td>
    </tr>
    <tr>
      <td><code>ru-UA</code></td>
      <td>Russian (Ukraine)</td>
      <td></td>
    </tr>
  </tbody>
</table>

