<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Hebrew

## Installation

You do not need any additional libraries to use Hebrew with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Hebrew
nii = Nii::Context.new "he" # => #<Nii::Context:he-IL>

# Value formatting
nii.format 9.99, style: :currency            # => "‏9.99 ₪"
nii.format Nii::Territory["IL"]              # => "ישראל"
nii.format ["de", "fr", "it"], as: :language # => "גרמנית, צרפתית ואיטלקית"

# Spelling out numbers
nii.spellout 115                                # => "מאה וחמש עשרה"
nii.spellout 1                                  # => "אחת"
nii.spellout 2020, rule: :year                  # => "אלפיים עשרים"
nii.spellout 115,  rule: :masculine             # => "מאה וחמישה עשר"
nii.spellout 115,  rule: [:ordinal, :masculine] # => "מאה וחמישה עשר"
nii.spellout 1,    rule: [:ordinal, :feminine]  # => "ראשונה"

# With RubyMoney
price = Money.eur 15_00
nii.format   price # => "‏15.00 €"
nii.spellout price # => "חמש עשרה אירו"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Hebrew</td>
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
    <tr>
      <td>afternoon1</td>
      <td>afternoon</td>
      <td>צהריים</td>
      <td>12:00 to 16:00</td>
    </tr>
    <tr>
      <td>afternoon2</td>
      <td>afternoon</td>
      <td>אחר הצהריים</td>
      <td>16:00 to 18:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>ערב</td>
      <td>18:00 to 22:00</td>
    </tr>
    <tr>
      <td>midnight</td>
      <td>midnight</td>
      <td>חצות</td>
      <td>at 00:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>בוקר</td>
      <td>06:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>לילה</td>
      <td>22:00 to 03:00</td>
    </tr>
    <tr>
      <td>night2</td>
      <td>night</td>
      <td>לפנות בוקר</td>
      <td>03:00 to 06:00</td>
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
      <td><code>he-IL</code></td>
      <td>Hebrew (Israel)</td>
      <td><code>he</code>, <code>heb</code>, and <code>iw</code></td>
    </tr>
  </tbody>
</table>

