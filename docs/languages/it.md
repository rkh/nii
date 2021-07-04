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

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Italian</td>
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
      <td>pomeriggio</td>
      <td>12:00 to 18:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>sera</td>
      <td>18:00 to 24:00</td>
    </tr>
    <tr>
      <td>midnight</td>
      <td>midnight</td>
      <td>mezzanotte</td>
      <td>at 00:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>mattina</td>
      <td>06:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>notte</td>
      <td>00:00 to 06:00</td>
    </tr>
    <tr>
      <td>noon</td>
      <td>noon</td>
      <td>mezzogiorno</td>
      <td>at 12:00</td>
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

