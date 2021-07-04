<!-- This file has been generated. Source: languages/_template.md.erb -->

# Vietnamese

## Installation

You do not need any additional libraries to use Vietnamese with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Vietnamese
nii = Nii::Context.new "vi" # => #<Nii::Context:vi-VN>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 ₫"
nii.format Nii::Territory["VN"]              # => "Việt Nam"
nii.format ["de", "fr", "it"], as: :language # => "Tiếng Đức, Tiếng Pháp và Tiếng Italy"

# Spelling out numbers
nii.numbers.spellout 115            # => "một trăm mười lăm"
nii.numbers.spellout 1              # => "một"
nii.numbers.spellout 2020, :year    # => "hai nghìn không trăm hai mươi"
nii.numbers.spellout 115,  :ordinal # => "thứ một trăm mười lăm"
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
      <td><code>vi-VN</code></td>
      <td>Vietnamese (Vietnam)</td>
      <td><code>vi</code> and <code>vie</code></td>
    </tr>
  </tbody>
</table>

