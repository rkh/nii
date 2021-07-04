<!-- This file has been generated. Source: languages/_template.md.erb -->

# Nepali

## Installation

You do not need any additional libraries to use Nepali with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Nepali
nii = Nii::Context.new "ne" # => #<Nii::Context:ne-NP>

# Value formatting
nii.format 9.99, style: :currency            # => "नेरू ९.९९"
nii.format Nii::Territory["NP"]              # => "नेपाल"
nii.format ["de", "fr", "it"], as: :language # => "जर्मन,फ्रान्सेली र इटालेली"

# Spelling out numbers
nii.numbers.spellout 115                        # => "एक सय पन्ध्र"
nii.numbers.spellout 1                          # => "एक"
nii.numbers.spellout 2020                       # => "दुई हजार बिस"
nii.numbers.spellout 2020, :year                # => "बिस सय बिस"
nii.numbers.spellout 115,  :ordinal, :masculine # => "एक सय पन्ध्रौँ"
nii.numbers.spellout 115,  :ordinal, :feminine  # => "एक सय पन्ध्रौँ"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Nepali</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>पूर्वाह्न</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>अपराह्न</td>
      <td>12:00 to 24:00</td>
    </tr>
    <tr>
      <td>afternoon1</td>
      <td>afternoon</td>
      <td>अपरान्ह</td>
      <td>12:00 to 16:00</td>
    </tr>
    <tr>
      <td>afternoon2</td>
      <td>afternoon</td>
      <td>साँझ</td>
      <td>16:00 to 19:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>बेलुकी</td>
      <td>19:00 to 22:00</td>
    </tr>
    <tr>
      <td>midnight</td>
      <td>midnight</td>
      <td>मध्यरात</td>
      <td>at 00:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>बिहान</td>
      <td>04:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>रात</td>
      <td>22:00 to 04:00</td>
    </tr>
    <tr>
      <td>noon</td>
      <td>noon</td>
      <td>मध्यान्ह</td>
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
      <td><code>ne-IN</code></td>
      <td>Nepali (India)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ne-NP</code></td>
      <td>Nepali (Nepal)</td>
      <td><code>ne</code>, <code>nep</code>, and <code>npi</code></td>
    </tr>
  </tbody>
</table>

