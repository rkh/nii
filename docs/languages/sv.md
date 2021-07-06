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
nii.spellout 115                                # => "ett­hundra­femton"
nii.spellout 1                                  # => "ett"
nii.spellout 2020                               # => "två­tusen tjugo"
nii.spellout 2020, rule: :year                  # => "tjugo­hundra­tjugo"
nii.spellout 1,    rule: :masculine             # => "en"
nii.spellout 1,    rule: :feminine              # => "en"
nii.spellout 1,    rule: :reale                 # => "en"
nii.spellout 115,  rule: [:ordinal, :neuter]    # => "ett­hundra femtonde"
nii.spellout 115,  rule: [:ordinal, :masculine] # => "ett­hundra femtonde"
nii.spellout 115,  rule: [:ordinal, :feminine]  # => "ett­hundra femtonde"
nii.spellout 115,  rule: [:ordinal, :reale]     # => "ett­hundra femtonde"

# With RubyMoney
price = Money.eur 15_00
nii.format   price # => "15,00 €"
nii.spellout price # => "femton euro"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Swedish</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>förmiddag</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>eftermiddag</td>
      <td>12:00 to 24:00</td>
    </tr>
    <tr>
      <td>afternoon1</td>
      <td>afternoon</td>
      <td>eftermiddag</td>
      <td>12:00 to 18:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>kväll</td>
      <td>18:00 to 24:00</td>
    </tr>
    <tr>
      <td>midnight</td>
      <td>midnight</td>
      <td>midnatt</td>
      <td>at 00:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>morgon</td>
      <td>05:00 to 10:00</td>
    </tr>
    <tr>
      <td>morning2</td>
      <td>morning</td>
      <td>förmiddag</td>
      <td>10:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>natt</td>
      <td>00:00 to 05:00</td>
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

