<!-- This file has been generated. Source: languages/_template.md.erb -->

# Ewe

## Installation

In order to use Ewe with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Ewe
nii = Nii::Context.new "ee" # => #<Nii::Context:ee-GH>

# Value formatting
nii.format 9.99, style: :currency            # => "GH₵9.99"
nii.format Nii::Territory["GH"]              # => "Ghana nutome"
nii.format ["de", "fr", "it"], as: :language # => "Germaniagbe, Fransegbe, kple Italiagbe"

# Spelling out numbers
nii.numbers.spellout 1              # => "ɖeka"
nii.numbers.spellout 115            # => "alafa ɖeka kple wuiatɔ̃"
nii.numbers.spellout 2020, :year    # => "akpe eve kple blaeve"
nii.numbers.spellout 1,    :ordinal # => "gbãtɔ"
nii.numbers.spellout 115,  :ordinal # => "alafa ɖeka kple wuiatɔ̃lia"
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
      <td><code>ee-GH</code></td>
      <td>Ewe (Ghana)</td>
      <td><code>ee</code> and <code>ewe</code></td>
    </tr>
    <tr>
      <td><code>ee-TG</code></td>
      <td>Ewe (Togo)</td>
      <td></td>
    </tr>
  </tbody>
</table>

