<!-- This file has been generated. Source: languages/_template.md.erb -->

# Chinese

## Installation

You do not need any additional libraries to use Chinese with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Chinese
nii = Nii::Context.new "zh" # => #<Nii::Context:zh-Hant-TW>

# Value formatting
nii.format 9.99, style: :currency            # => "$9.99"
nii.format Nii::Territory["TW"]              # => "台灣"
nii.format ["de", "fr", "it"], as: :language # => "德文、法文和義大利文"

# Spelling out numbers
nii.numbers.spellout 115              # => "一百一十五"
nii.numbers.spellout 1                # => "一"
nii.numbers.spellout 2020             # => "二千零二十"
nii.numbers.spellout 2020, :year      # => "二二〇"
nii.numbers.spellout 115,  :financial # => "壹佰壹拾伍"
nii.numbers.spellout 115,  :ordinal   # => "第一百一十五"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Chinese</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>上午</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>下午</td>
      <td>12:00 to 24:00</td>
    </tr>
    <tr>
      <td>afternoon1</td>
      <td>afternoon</td>
      <td>中午</td>
      <td>12:00 to 13:00</td>
    </tr>
    <tr>
      <td>afternoon2</td>
      <td>afternoon</td>
      <td>下午</td>
      <td>13:00 to 19:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>晚上</td>
      <td>19:00 to 24:00</td>
    </tr>
    <tr>
      <td>midnight</td>
      <td>midnight</td>
      <td>午夜</td>
      <td>at 00:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>清晨</td>
      <td>05:00 to 08:00</td>
    </tr>
    <tr>
      <td>morning2</td>
      <td>morning</td>
      <td>上午</td>
      <td>08:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>凌晨</td>
      <td>00:00 to 05:00</td>
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
      <td><code>zh-Hans</code></td>
      <td>Simplified Chinese</td>
      <td><code>zh-cmn-Hans</code></td>
    </tr>
    <tr>
      <td><code>zh-Hans-CN</code></td>
      <td>Simplified Chinese (China)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>zh-Hans-HK</code></td>
      <td>Simplified Chinese (Hong Kong SAR China)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>zh-Hans-MO</code></td>
      <td>Simplified Chinese (Macao SAR China)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>zh-Hans-SG</code></td>
      <td>Simplified Chinese (Singapore)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>zh-Hant</code></td>
      <td>Traditional Chinese</td>
      <td><code>zh-cmn-Hant</code></td>
    </tr>
    <tr>
      <td><code>zh-Hant-HK</code></td>
      <td>Traditional Chinese (Hong Kong SAR China)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>zh-Hant-MO</code></td>
      <td>Traditional Chinese (Macao SAR China)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>zh-Hant-TW</code></td>
      <td>Traditional Chinese (Taiwan)</td>
      <td><code>zh</code>, <code>chi</code>, <code>cmn</code>, <code>zh-cmn</code>, <code>zh-guoyu</code>, and <code>zho</code></td>
    </tr>
  </tbody>
</table>

