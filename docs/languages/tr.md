<!-- This file has been generated. Source: languages/_template.md.erb -->

# Turkish

## Installation

You do not need any additional libraries to use Turkish with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Turkish
nii = Nii::Context.new "tr" # => #<Nii::Context:tr-TR>

# Value formatting
nii.format 9.99, style: :currency            # => "₺9,99"
nii.format Nii::Territory["TR"]              # => "Türkiye"
nii.format ["de", "fr", "it"], as: :language # => "Almanca, Fransızca ve İtalyanca"

# Spelling out numbers
nii.numbers.spellout 1              # => "bir"
nii.numbers.spellout 115            # => "yüz on beş"
nii.numbers.spellout 2020, :year    # => "iki bin yirmi"
nii.numbers.spellout 1,    :ordinal # => "birinci"
nii.numbers.spellout 115,  :ordinal # => "yüz on beşinci"
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
      <td><code>tr-CY</code></td>
      <td>Turkish (Cyprus)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>tr-TR</code></td>
      <td>Turkish (Turkey)</td>
      <td><code>tr</code> and <code>tur</code></td>
    </tr>
  </tbody>
</table>

