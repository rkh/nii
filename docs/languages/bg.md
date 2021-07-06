<!-- This file has been generated. Source: languages/_template.md.erb -->

# Bulgarian

## Installation

You do not need any additional libraries to use Bulgarian with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Bulgarian
nii = Nii::Context.new "bg" # => #<Nii::Context:bg-BG>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 лв."
nii.format Nii::Territory["BG"]              # => "България"
nii.format ["de", "fr", "it"], as: :language # => "немски, френски и италиански"

# Spelling out numbers
nii.spellout 115                    # => "сто петнадесет"
nii.spellout 1                      # => "едно"
nii.spellout 2020, rule: :year      # => "две хиляди двадесет"
nii.spellout 1,    rule: :masculine # => "един"

# With RubyMoney
price = Money.eur 15_00
nii.format   price # => "15,00 €"
nii.spellout price # => "петнадесет евро"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Bulgarian</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>am</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>pm</td>
      <td>12:00 to 24:00</td>
    </tr>
    <tr>
      <td>afternoon1</td>
      <td>afternoon</td>
      <td>следобед</td>
      <td>14:00 to 18:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>вечерта</td>
      <td>18:00 to 22:00</td>
    </tr>
    <tr>
      <td>midnight</td>
      <td>midnight</td>
      <td>полунощ</td>
      <td>at 00:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>сутринта</td>
      <td>04:00 to 11:00</td>
    </tr>
    <tr>
      <td>morning2</td>
      <td>morning</td>
      <td>на обяд</td>
      <td>11:00 to 14:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>през нощта</td>
      <td>22:00 to 04:00</td>
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
      <td><code>ivanchov</code></td>
      <td>Bulgarian in 1899 orthography</td>
      <td>Bulgarian orthography introduced by Todor Ivanchov in 1899</td>
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
      <td><code>bg-BG</code></td>
      <td>Bulgarian (Bulgaria)</td>
      <td><code>bg</code> and <code>bul</code></td>
    </tr>
  </tbody>
</table>

