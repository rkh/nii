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
nii.numbers.spellout 1              # => "ஒன்று"
nii.numbers.spellout 115            # => "நூறு பதினைந்து"
nii.numbers.spellout 2020, :year    # => "இரண்டு ஆயிரம் இருபது"
nii.numbers.spellout 1,    :ordinal # => "முதலாவது"
nii.numbers.spellout 115,  :ordinal # => "115ாவது"
```


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

