<!-- This file has been generated. Source: languages/_template.md.erb -->

# Korean

## Installation

You do not need any additional libraries to use Korean with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Korean
nii = Nii::Context.new "ko" # => #<Nii::Context:ko-KR>

# Value formatting
nii.format 9.99, style: :currency            # => "₩9.99"
nii.format Nii::Territory["KR"]              # => "대한민국"
nii.format ["de", "fr", "it"], as: :language # => "독일어, 프랑스어 및 이탈리아어"

# Spelling out numbers
nii.numbers.spellout 115                                 # => "백십오"
nii.numbers.spellout 1                                   # => "일"
nii.numbers.spellout 2020, :year                         # => "이천이십"
nii.numbers.spellout 115,  :native, :attributive         # => "백열다섯"
nii.numbers.spellout 1,    :native                       # => "하나"
nii.numbers.spellout 115,  :financial                    # => "일백일십오"
nii.numbers.spellout 115,  :ordinal, :sinokorean, :count # => "백십오 번째"
nii.numbers.spellout 115,  :ordinal, :native, :count     # => "백열다섯 번째"
nii.numbers.spellout 115,  :ordinal, :sinokorean         # => "백십오째"
nii.numbers.spellout 115,  :ordinal, :native             # => "백열다섯째"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Korean</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>오전</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>오후</td>
      <td>12:00 to 24:00</td>
    </tr>
    <tr>
      <td>afternoon1</td>
      <td>afternoon</td>
      <td>오후</td>
      <td>12:00 to 18:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>저녁</td>
      <td>18:00 to 21:00</td>
    </tr>
    <tr>
      <td>midnight</td>
      <td>midnight</td>
      <td>자정</td>
      <td>at 00:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>새벽</td>
      <td>03:00 to 06:00</td>
    </tr>
    <tr>
      <td>morning2</td>
      <td>morning</td>
      <td>오전</td>
      <td>06:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>밤</td>
      <td>21:00 to 03:00</td>
    </tr>
    <tr>
      <td>noon</td>
      <td>noon</td>
      <td>정오</td>
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
      <td><code>ko-KP</code></td>
      <td>Korean (North Korea)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ko-KR</code></td>
      <td>Korean (South Korea)</td>
      <td><code>ko</code> and <code>kor</code></td>
    </tr>
  </tbody>
</table>

