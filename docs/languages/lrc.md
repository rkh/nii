<!-- This file has been generated. Source: languages/_template.md.erb -->

# Northern Luri

## Installation

In order to use Northern Luri with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Northern Luri
nii = Nii::Context.new "lrc" # => #<Nii::Context:lrc-IR>

# Value formatting
nii.format 9.99, style: :currency            # => "IRR ۹٫۹۹"
nii.format Nii::Territory["IR"]              # => "IR"
nii.format ["de", "fr", "it"], as: :language # => "آلمانی, فآرانسئ ئی, ئیتالیایی"

# Spelling out numbers
nii.numbers.spellout 1           # => "یٱک"
nii.numbers.spellout 115         # => "صد و پۊمزٱ"
nii.numbers.spellout 2020, :year # => "دۏ هزار و بیست"
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
      <td><code>lrc-IQ</code></td>
      <td>Northern Luri (Iraq)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>lrc-IR</code></td>
      <td>Northern Luri (Iran)</td>
      <td><code>lrc</code></td>
    </tr>
  </tbody>
</table>

