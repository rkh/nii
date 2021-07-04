<!-- This file has been generated. Source: languages/_template.md.erb -->

# Tamil

## Installation

You do not need any additional libraries to use Tamil with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Tamil
nii = Nii::Context.new "ta" # => #<Nii::Context:ta-IN>

# Value formatting
nii.format 9.99, style: :currency            # => "₹ 9.99"
nii.format Nii::Territory["IN"]              # => "இந்தியா"
nii.format ["de", "fr", "it"], as: :language # => "ஜெர்மன், பிரெஞ்சு மற்றும் இத்தாலியன்"

# Spelling out numbers
nii.numbers.spellout 115            # => "நூறு பதினைந்து"
nii.numbers.spellout 1              # => "ஒன்று"
nii.numbers.spellout 2020, :year    # => "இரண்டு ஆயிரம் இருபது"
nii.numbers.spellout 115,  :ordinal # => "115ாவது"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Tamil</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>முற்பகல்</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>பிற்பகல்</td>
      <td>12:00 to 24:00</td>
    </tr>
    <tr>
      <td>afternoon1</td>
      <td>afternoon</td>
      <td>மதியம்</td>
      <td>12:00 to 14:00</td>
    </tr>
    <tr>
      <td>afternoon2</td>
      <td>afternoon</td>
      <td>பிற்பகல்</td>
      <td>14:00 to 16:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>மாலை</td>
      <td>16:00 to 18:00</td>
    </tr>
    <tr>
      <td>evening2</td>
      <td>evening</td>
      <td>அந்தி மாலை</td>
      <td>18:00 to 21:00</td>
    </tr>
    <tr>
      <td>midnight</td>
      <td>midnight</td>
      <td>நள்ளிரவு</td>
      <td>at 00:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>அதிகாலை</td>
      <td>03:00 to 05:00</td>
    </tr>
    <tr>
      <td>morning2</td>
      <td>morning</td>
      <td>காலை</td>
      <td>05:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>இரவு</td>
      <td>21:00 to 03:00</td>
    </tr>
    <tr>
      <td>noon</td>
      <td>noon</td>
      <td>நண்பகல்</td>
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
      <td><code>ta-IN</code></td>
      <td>Tamil (India)</td>
      <td><code>ta</code> and <code>tam</code></td>
    </tr>
    <tr>
      <td><code>ta-LK</code></td>
      <td>Tamil (Sri Lanka)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ta-MY</code></td>
      <td>Tamil (Malaysia)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ta-SG</code></td>
      <td>Tamil (Singapore)</td>
      <td></td>
    </tr>
  </tbody>
</table>

