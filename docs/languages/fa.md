<!-- This file has been generated. Source: languages/_template.md.erb -->

# Persian

## Installation

You do not need any additional libraries to use Persian with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Persian
nii = Nii::Context.new "fa" # => #<Nii::Context:fa-IR>

# Value formatting
nii.format 9.99, style: :currency            # => "‎ریال ۹٫۹۹"
nii.format Nii::Territory["IR"]              # => "ایران"
nii.format ["de", "fr", "it"], as: :language # => "آلمانی،‏ فرانسوی، و ایتالیایی"

# Spelling out numbers
nii.numbers.spellout 115         # => "صد و پانزده"
nii.numbers.spellout 1           # => "یک"
nii.numbers.spellout 2020, :year # => "دو هزار و بیست"
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
      <td><code>fa-AF</code></td>
      <td>Dari</td>
      <td><code>drw</code>, <code>prs</code>, and <code>tnf</code></td>
    </tr>
    <tr>
      <td><code>fa-IR</code></td>
      <td>Persian (Iran)</td>
      <td><code>fa</code>, <code>fas</code>, <code>per</code>, and <code>pes</code></td>
    </tr>
  </tbody>
</table>

