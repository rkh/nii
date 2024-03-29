<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Esperanto

## Installation

In order to use Esperanto with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Esperanto
nii = Nii::Context.new "eo" # => #<Nii::Context:eo-001>

# Value formatting
nii.format 9.99, currency: "USD"             # => "US$ 9,99"
nii.format Nii::Territory["001"]             # => "Mondo"
nii.format ["de", "fr", "it"], as: :language # => "germana, franca, itala"

# Spelling out numbers
nii.spellout 115                  # => "cent dek kvin"
nii.spellout 1                    # => "unu"
nii.spellout 2020, rule: :year    # => "du mil dudek"
nii.spellout 115,  rule: :ordinal # => "cent dek kvina"

# With RubyMoney
price = Money.eur 15_00
nii.format   price # => "€ 15,00"
nii.spellout price # => "dek kvin EUR"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Esperanto</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>atm</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>ptm</td>
      <td>12:00 to 24:00</td>
    </tr>
  </tbody>
</table>


## Variants

<table>
  <thead>
    <tr>
      <th>Subtag</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>hsistemo</code></td>
      <td>Standard H-system orthographic fallback for spelling Esperanto</td>
    </tr>
    <tr>
      <td><code>xsistemo</code></td>
      <td>Standard X-system orthographic fallback for spelling Esperanto</td>
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
      <td><code>eo-001</code></td>
      <td>Esperanto (world)</td>
      <td><code>eo</code> and <code>epo</code></td>
    </tr>
  </tbody>
</table>

