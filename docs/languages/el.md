<!-- This file has been generated. Source: languages/_template.md.erb -->

# Greek

## Installation

You do not need any additional libraries to use Greek with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Greek
nii = Nii::Context.new "el" # => #<Nii::Context:el-GR>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 €"
nii.format Nii::Territory["GR"]              # => "Ελλάδα"
nii.format ["de", "fr", "it"], as: :language # => "Γερμανικά, Γαλλικά και Ιταλικά"

# Spelling out numbers
nii.spellout 115                                # => "εκατόν δεκα­πέντε"
nii.spellout 1                                  # => "ένα"
nii.spellout 2020, rule: :year                  # => "δύο χίλιάδες είκοσι"
nii.spellout 1,    rule: :masculine             # => "ένας"
nii.spellout 1,    rule: :feminine              # => "μία"
nii.spellout 115,  rule: [:ordinal, :masculine] # => "εκατοστός δέκατος πέμπτος"
nii.spellout 115,  rule: [:ordinal, :feminine]  # => "εκατοστή δέκατη πέμπτη"
nii.spellout 115,  rule: [:ordinal, :neuter]    # => "εκατοστό δέκατο πέμπτο"

# With RubyMoney
price = Money.eur 15_00
nii.format   price # => "15,00 €"
nii.spellout price # => "δεκα­πέντε ευρώ"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Greek</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>π.μ.</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>μ.μ.</td>
      <td>12:00 to 24:00</td>
    </tr>
    <tr>
      <td>afternoon1</td>
      <td>afternoon</td>
      <td>μεσημέρι</td>
      <td>12:00 to 17:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>απόγευμα</td>
      <td>17:00 to 20:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>πρωί</td>
      <td>04:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>βράδυ</td>
      <td>20:00 to 04:00</td>
    </tr>
  </tbody>
</table>


## Variants

<table>
  <thead>
    <tr>
      <th>Subtag</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>monoton</code></td>
      <td>Monotonic Greek</td>
    </tr>
    <tr>
      <td><code>polyton</code></td>
      <td>Polytonic Greek</td>
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
      <td><code>el-CY</code></td>
      <td>Greek (Cyprus)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>el-GR</code></td>
      <td>Greek (Greece)</td>
      <td><code>el</code>, <code>ell</code>, and <code>gre</code></td>
    </tr>
  </tbody>
</table>

