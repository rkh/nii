<!-- This file has been generated. Source: languages/_template.md.erb -->

# Irish

## Installation

You do not need any additional libraries to use Irish with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Irish
nii = Nii::Context.new "ga" # => #<Nii::Context:ga-IE>

# Value formatting
nii.format 9.99, style: :currency            # => "€9.99"
nii.format Nii::Territory["IE"]              # => "Éire"
nii.format ["de", "fr", "it"], as: :language # => "Gearmáinis, Fraincis agus Iodáilis"

# Spelling out numbers
nii.numbers.spellout 115         # => "céad a cúig déag"
nii.numbers.spellout 1           # => "a haon"
nii.numbers.spellout 2020        # => "dhá mhíle, fiche"
nii.numbers.spellout 2020, :year # => "fiche fiche"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Irish</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>r.n.</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>i.n.</td>
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
      <td><code>ga-GB</code></td>
      <td>Irish (United Kingdom)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ga-IE</code></td>
      <td>Irish (Ireland)</td>
      <td><code>ga</code> and <code>gle</code></td>
    </tr>
  </tbody>
</table>

