<!-- This file has been generated. Source: languages/_template.md.erb -->

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
nii.numbers.spellout 1              # => "unu"
nii.numbers.spellout 115            # => "cent dek kvin"
nii.numbers.spellout 2020, :year    # => "du mil dudek"
nii.numbers.spellout 1,    :ordinal # => "unua"
nii.numbers.spellout 115,  :ordinal # => "cent dek kvina"
```

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

