<!-- This file has been generated. Source: languages/_template.md.erb -->

# Khmer

## Installation

You do not need any additional libraries to use Khmer with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Khmer
nii = Nii::Context.new "km" # => #<Nii::Context:km-KH>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99៛"
nii.format Nii::Territory["KH"]              # => "កម្ពុជា"
nii.format ["de", "fr", "it"], as: :language # => "អាល្លឺម៉ង់, បារាំង និង អ៊ីតាលី"

# Spelling out numbers
nii.numbers.spellout 115            # => "មួយ​រយ​ដប់​ប្រាំ"
nii.numbers.spellout 1              # => "មួយ"
nii.numbers.spellout 2020, :year    # => "ពីរ​ពាន់​ម្ភៃ"
nii.numbers.spellout 115,  :ordinal # => "ទីមួយ​រយ​ដប់​ប្រាំ"
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
      <td><code>km-KH</code></td>
      <td>Khmer (Cambodia)</td>
      <td><code>km</code> and <code>khm</code></td>
    </tr>
  </tbody>
</table>

