<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Japanese

## Installation

You do not need any additional libraries to use Japanese with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Japanese
nii = Nii::Context.new "ja" # => #<Nii::Context:ja-JP>

# Value formatting
nii.format 9.99, style: :currency            # => "￥9.99"
nii.format Nii::Territory["JP"]              # => "日本"
nii.format ["de", "fr", "it"], as: :language # => "ドイツ語、フランス語、イタリア語"

# Spelling out numbers
nii.spellout 115                        # => "百十五"
nii.spellout 1                          # => "一"
nii.spellout 2020                       # => "二千二十"
nii.spellout 1,    rule: [:year, :latn] # => "一"
nii.spellout 2020, rule: :year          # => "二二〇"
nii.spellout 115,  rule: :financial     # => "壱百拾伍"
nii.spellout 115,  rule: :ordinal       # => "第百十五"

# With RubyMoney
price = Money.eur 15_00
nii.format   price # => "€15.00"
nii.spellout price # => "十五ユーロ"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Japanese</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>午前</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>午後</td>
      <td>12:00 to 24:00</td>
    </tr>
    <tr>
      <td>afternoon1</td>
      <td>afternoon</td>
      <td>昼</td>
      <td>12:00 to 16:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>夕方</td>
      <td>16:00 to 19:00</td>
    </tr>
    <tr>
      <td>midnight</td>
      <td>midnight</td>
      <td>真夜中</td>
      <td>at 00:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>朝</td>
      <td>04:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>夜</td>
      <td>19:00 to 23:00</td>
    </tr>
    <tr>
      <td>night2</td>
      <td>night</td>
      <td>夜中</td>
      <td>23:00 to 04:00</td>
    </tr>
    <tr>
      <td>noon</td>
      <td>noon</td>
      <td>正午</td>
      <td>at 12:00</td>
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
      <td><code>ja-JP</code></td>
      <td>Japanese (Japan)</td>
      <td><code>ja</code> and <code>jpn</code></td>
    </tr>
  </tbody>
</table>

