<!-- This file has been generated. Source: languages/_template.md.erb -->

# Northern Sami

## Installation

In order to use Northern Sami with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Northern Sami
nii = Nii::Context.new "se" # => #<Nii::Context:se-NO>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 kr"
nii.format Nii::Territory["NO"]              # => "Norga"
nii.format ["de", "fr", "it"], as: :language # => "duiskkagiella, fránskkagiella ja itáliagiella"

# Spelling out numbers
nii.numbers.spellout 115         # => "okta­čuođi­vihtta­nuppe­lohkái"
nii.numbers.spellout 1           # => "okta"
nii.numbers.spellout 2020        # => "guokte­duhát guokte­logi"
nii.numbers.spellout 2020, :year # => "guokte­logi­čuođi­guokte­logi"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Northern Sami</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>iđitbeaivi</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>eahketbeaivi</td>
      <td>12:00 to 24:00</td>
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
      <td><code>se-FI</code></td>
      <td>Northern Sami (Finland)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>se-NO</code></td>
      <td>Northern Sami (Norway)</td>
      <td><code>se</code> and <code>sme</code></td>
    </tr>
    <tr>
      <td><code>se-SE</code></td>
      <td>Northern Sami (Sweden)</td>
      <td></td>
    </tr>
  </tbody>
</table>

