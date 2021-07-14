<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Amharic

## Installation

You do not need any additional libraries to use Amharic with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Amharic
nii = Nii::Context.new "am" # => #<Nii::Context:am-ET>

# Value formatting
nii.format 9.99, style: :currency            # => "ብር 9.99"
nii.format Nii::Territory["ET"]              # => "ኢትዮጵያ"
nii.format ["de", "fr", "it"], as: :language # => "ጀርመን፣ ፈረንሳይኛ, እና ጣሊያንኛ"

# Spelling out numbers
nii.spellout 115                  # => "መቶ አስር አምስት"
nii.spellout 1                    # => "አንድ"
nii.spellout 2020                 # => "ሁለት ሺ ሁለት አስር"
nii.spellout 2020, rule: :year    # => "ሁለት አስር መቶ ሁለት አስር"
nii.spellout 115,  rule: :ordinal # => "መቶ አስር አምስትኛ"

# With RubyMoney
price = Money.eur 15_00
nii.format   price # => "€15.00"
nii.spellout price # => "አስር አምስት ዩሮ"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Amharic</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>ጥዋት</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>ከሰዓት</td>
      <td>12:00 to 24:00</td>
    </tr>
    <tr>
      <td>afternoon1</td>
      <td>afternoon</td>
      <td>ከሰዓት በኋላ</td>
      <td>12:00 to 18:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>ማታ</td>
      <td>18:00 to 24:00</td>
    </tr>
    <tr>
      <td>midnight</td>
      <td>midnight</td>
      <td>እኩለ ሌሊት</td>
      <td>at 00:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>ጥዋት1</td>
      <td>06:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>ሌሊት</td>
      <td>00:00 to 06:00</td>
    </tr>
    <tr>
      <td>noon</td>
      <td>noon</td>
      <td>ቀትር</td>
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
      <td><code>am-ET</code></td>
      <td>Amharic (Ethiopia)</td>
      <td><code>am</code> and <code>amh</code></td>
    </tr>
  </tbody>
</table>

