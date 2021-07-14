<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Macedonian

## Installation

You do not need any additional libraries to use Macedonian with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Macedonian
nii = Nii::Context.new "mk" # => #<Nii::Context:mk-MK>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 ден."
nii.format Nii::Territory["MK"]              # => "Северна Македонија"
nii.format ["de", "fr", "it"], as: :language # => "германски, француски и италијански"

# Spelling out numbers
nii.spellout 115                   # => "еднасто петнаесет"
nii.spellout 1                     # => "еден"
nii.spellout 2020, rule: :year     # => "две илјада дваесет"
nii.spellout 1,    rule: :neuter   # => "едно"
nii.spellout 1,    rule: :feminine # => "една"

# With RubyMoney
price = Money.eur 15_00
nii.format   price # => "15,00 €"
nii.spellout price # => "петнаесет евра"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Macedonian</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>претпладне</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>попладне</td>
      <td>12:00 to 24:00</td>
    </tr>
    <tr>
      <td>afternoon1</td>
      <td>afternoon</td>
      <td>попладне</td>
      <td>12:00 to 18:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>навечер</td>
      <td>18:00 to 24:00</td>
    </tr>
    <tr>
      <td>midnight</td>
      <td>midnight</td>
      <td>на полноќ</td>
      <td>at 00:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>наутро</td>
      <td>04:00 to 10:00</td>
    </tr>
    <tr>
      <td>morning2</td>
      <td>morning</td>
      <td>претпладне</td>
      <td>10:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>по полноќ</td>
      <td>00:00 to 04:00</td>
    </tr>
    <tr>
      <td>noon</td>
      <td>noon</td>
      <td>напладне</td>
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
      <td><code>mk-MK</code></td>
      <td>Macedonian (North Macedonia)</td>
      <td><code>mk</code>, <code>mac</code>, and <code>mkd</code></td>
    </tr>
  </tbody>
</table>

