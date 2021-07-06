<!-- This file has been generated. Source: languages/_template.md.erb -->

# Albanian

## Installation

You do not need any additional libraries to use Albanian with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Albanian
nii = Nii::Context.new "sq" # => #<Nii::Context:sq-AL>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 Lekë"
nii.format Nii::Territory["AL"]              # => "Shqipëri"
nii.format ["de", "fr", "it"], as: :language # => "gjermanisht, frëngjisht dhe italisht"

# Spelling out numbers
nii.spellout 115               # => "njëqind e pesëmbëdhjetë"
nii.spellout 1                 # => "një"
nii.spellout 2020, rule: :year # => "dy mijë e njëzet"

# With RubyMoney
price = Money.eur 15_00
nii.format   price # => "15,00 €"
nii.spellout price # => "pesëmbëdhjetë euro"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Albanian</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>paradite</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>pasdite</td>
      <td>12:00 to 24:00</td>
    </tr>
    <tr>
      <td>afternoon1</td>
      <td>afternoon</td>
      <td>pasdite</td>
      <td>12:00 to 18:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>mbrëmje</td>
      <td>18:00 to 24:00</td>
    </tr>
    <tr>
      <td>midnight</td>
      <td>midnight</td>
      <td>mesnatë</td>
      <td>at 00:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>mëngjes</td>
      <td>04:00 to 09:00</td>
    </tr>
    <tr>
      <td>morning2</td>
      <td>morning</td>
      <td>paradite</td>
      <td>09:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>natë</td>
      <td>00:00 to 04:00</td>
    </tr>
    <tr>
      <td>noon</td>
      <td>noon</td>
      <td>mesditë</td>
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
      <td><code>sq-AL</code></td>
      <td>Albanian (Albania)</td>
      <td><code>sq</code>, <code>alb</code>, <code>als</code>, and <code>sqi</code></td>
    </tr>
    <tr>
      <td><code>sq-MK</code></td>
      <td>Albanian (North Macedonia)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>sq-XK</code></td>
      <td>Albanian (Kosovo)</td>
      <td></td>
    </tr>
  </tbody>
</table>

