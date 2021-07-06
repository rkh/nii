<!-- This file has been generated. Source: languages/_template.md.erb -->

# Hungarian

## Installation

You do not need any additional libraries to use Hungarian with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Hungarian
nii = Nii::Context.new "hu" # => #<Nii::Context:hu-HU>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 Ft"
nii.format Nii::Territory["HU"]              # => "Magyarország"
nii.format ["de", "fr", "it"], as: :language # => "német, francia és olasz"

# Spelling out numbers
nii.spellout 115                              # => "száz­tizen­öt"
nii.spellout 1                                # => "egy"
nii.spellout 2020, rule: :year                # => "két­ezer­húsz"
nii.spellout 115,  rule: :ordinal             # => "száztizenötödik"
nii.spellout 115,  rule: [:ordinal, :verbose] # => "egyszáztizenötödik"

# With RubyMoney
price = Money.eur 15_00
nii.format   price # => "15,00 €"
nii.spellout price # => "tizen­öt euró"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Hungarian</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>de.</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>du.</td>
      <td>12:00 to 24:00</td>
    </tr>
    <tr>
      <td>afternoon1</td>
      <td>afternoon</td>
      <td>délután</td>
      <td>12:00 to 18:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>este</td>
      <td>18:00 to 21:00</td>
    </tr>
    <tr>
      <td>midnight</td>
      <td>midnight</td>
      <td>éjfél</td>
      <td>at 00:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>reggel</td>
      <td>06:00 to 09:00</td>
    </tr>
    <tr>
      <td>morning2</td>
      <td>morning</td>
      <td>délelőtt</td>
      <td>09:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>éjjel</td>
      <td>21:00 to 04:00</td>
    </tr>
    <tr>
      <td>night2</td>
      <td>night</td>
      <td>hajnal</td>
      <td>04:00 to 06:00</td>
    </tr>
    <tr>
      <td>noon</td>
      <td>noon</td>
      <td>dél</td>
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
      <td><code>hu-HU</code></td>
      <td>Hungarian (Hungary)</td>
      <td><code>hu</code> and <code>hun</code></td>
    </tr>
  </tbody>
</table>

