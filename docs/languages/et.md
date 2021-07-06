<!-- This file has been generated. Source: languages/_template.md.erb -->

# Estonian

## Installation

You do not need any additional libraries to use Estonian with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Estonian
nii = Nii::Context.new "et" # => #<Nii::Context:et-EE>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 €"
nii.format Nii::Territory["EE"]              # => "Eesti"
nii.format ["de", "fr", "it"], as: :language # => "saksa, prantsuse ja itaalia"

# Spelling out numbers
nii.spellout 115               # => "ükssada viisteist"
nii.spellout 1                 # => "üks"
nii.spellout 2020              # => "kaks tuhat kakskümmend"
nii.spellout 2020, rule: :year # => "kakskümmend sada kakskümmend"

# With RubyMoney
price = Money.eur 15_00
nii.format   price # => "15,00 €"
nii.spellout price # => "viisteist eurot"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Estonian</td>
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
      <td>pärastlõuna</td>
      <td>12:00 to 18:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>õhtu</td>
      <td>18:00 to 23:00</td>
    </tr>
    <tr>
      <td>midnight</td>
      <td>midnight</td>
      <td>kesköö</td>
      <td>at 00:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>hommik</td>
      <td>05:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>öö</td>
      <td>23:00 to 05:00</td>
    </tr>
    <tr>
      <td>noon</td>
      <td>noon</td>
      <td>keskpäev</td>
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
      <td><code>et-EE</code></td>
      <td>Estonian (Estonia)</td>
      <td><code>et</code>, <code>ekk</code>, and <code>est</code></td>
    </tr>
  </tbody>
</table>

