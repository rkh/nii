<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

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
nii.spellout 115               # => "صد و پۊمزٱ"
nii.spellout 1                 # => "یٱک"
nii.spellout 2020, rule: :year # => "دۏ هزار و بیست"

# With RubyMoney
price = Money.eur 15_00
nii.format   price # => "€ ۱۵٫۰۰"
nii.spellout price # => "پۊمزٱ یورو"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Northern Luri</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>AM</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>PM</td>
      <td>12:00 to 24:00</td>
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

