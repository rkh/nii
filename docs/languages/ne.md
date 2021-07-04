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

