<!-- This file has been generated. Source: languages/_template.md.erb -->

# Cantonese

## Installation

You do not need any additional libraries to use Cantonese with Nii.
However, you do need to install `nii-extra-locales` in order to use Cantonese (Simplified).
See the [list of locales](#locales) below.

## Example Usage

``` ruby
# Create a context for Cantonese
nii = Nii::Context.new "yue" # => #<Nii::Context:yue-Hant-HK>

# Value formatting
nii.format 9.99, style: :currency            # => "HK$9.99"
nii.format Nii::Territory["HK"]              # => "中華人民共和國香港特別行政區"
nii.format ["de", "fr", "it"], as: :language # => "德文、法文同義大利文"

# Spelling out numbers
nii.numbers.spellout 1                # => "一"
nii.numbers.spellout 115              # => "一百一十五"
nii.numbers.spellout 2020             # => "二千零二十"
nii.numbers.spellout 2020, :year      # => "二二零"
nii.numbers.spellout 1,    :financial # => "壹"
nii.numbers.spellout 115,  :financial # => "壹佰壹拾伍"
nii.numbers.spellout 1,    :ordinal   # => "第一"
nii.numbers.spellout 115,  :ordinal   # => "第一百一十五"
```

## Variants

<table>
  <thead>
    <tr>
      <th>Subtag</th>
      <th>Description</th>
      <th>Comments</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>jyutping</code></td>
      <td>Jyutping Cantonese Romanization</td>
      <td>Jyutping romanization of Cantonese</td>
    </tr>
  </tbody>
</table>

## Locales

<table>
  <thead>
    <tr>
      <th>Locale Tag</th>
      <th>Library</th>
      <th>Description</th>
      <th>Aliases</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>yue-Hans</code></td>
      <td><code>nii-extra-locales</code></td>
      <td>Cantonese (Simplified)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>yue-Hans-CN</code></td>
      <td><code>nii-core</code></td>
      <td>Cantonese (Simplified, China)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>yue-Hant</code></td>
      <td><code>nii-core</code></td>
      <td>Cantonese (Traditional)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>yue-Hant-HK</code></td>
      <td><code>nii-core</code></td>
      <td>Cantonese (Traditional, Hong Kong SAR China)</td>
      <td><code>yue</code> and <code>zh-yue</code></td>
    </tr>
  </tbody>
</table>

