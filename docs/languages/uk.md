<!-- This file has been generated. Source: languages/_template.md.erb -->

# Ukrainian

## Installation

You do not need any additional libraries to use Ukrainian with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Ukrainian
nii = Nii::Context.new "uk" # => #<Nii::Context:uk-UA>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 ₴"
nii.format Nii::Territory["UA"]              # => "Україна"
nii.format ["de", "fr", "it"], as: :language # => "німецька, французька і італійська"

# Spelling out numbers
nii.numbers.spellout 115             # => "сто пʼятнадцять"
nii.numbers.spellout 1               # => "один"
nii.numbers.spellout 2020, :year     # => "дві  двадцять"
nii.numbers.spellout 1,    :neuter   # => "одне"
nii.numbers.spellout 1,    :feminine # => "одна"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Ukrainian</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>дп</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>пп</td>
      <td>12:00 to 24:00</td>
    </tr>
    <tr>
      <td>afternoon1</td>
      <td>afternoon</td>
      <td>день</td>
      <td>12:00 to 18:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>вечір</td>
      <td>18:00 to 24:00</td>
    </tr>
    <tr>
      <td>midnight</td>
      <td>midnight</td>
      <td>північ</td>
      <td>at 00:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>ранок</td>
      <td>04:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>ніч</td>
      <td>00:00 to 04:00</td>
    </tr>
    <tr>
      <td>noon</td>
      <td>noon</td>
      <td>полудень</td>
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
      <td><code>uk-UA</code></td>
      <td>Ukrainian (Ukraine)</td>
      <td><code>uk</code> and <code>ukr</code></td>
    </tr>
  </tbody>
</table>

