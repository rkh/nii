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
nii.numbers.spellout 115              # => "一百一十五"
nii.numbers.spellout 1                # => "一"
nii.numbers.spellout 2020             # => "二千零二十"
nii.numbers.spellout 2020, :year      # => "二二零"
nii.numbers.spellout 115,  :financial # => "壹佰壹拾伍"
nii.numbers.spellout 115,  :ordinal   # => "第一百一十五"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Cantonese</td>
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
      <td>下晝</td>
      <td>13:00 to 19:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>夜晚</td>
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
      <td>朝早</td>
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

