<!-- This file has been generated. Source: languages/_template.md.erb -->

# Danish

## Installation

You do not need any additional libraries to use Danish with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Danish
nii = Nii::Context.new "da" # => #<Nii::Context:da-DK>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 kr."
nii.format Nii::Territory["DK"]              # => "Danmark"
nii.format ["de", "fr", "it"], as: :language # => "tysk, fransk og italiensk"

# Spelling out numbers
nii.numbers.spellout 115                     # => "hundrede og femten"
nii.numbers.spellout 1                       # => "et"
nii.numbers.spellout 2020                    # => "to tusind og tyve"
nii.numbers.spellout 2020, :year             # => "tyve­hundrede og tyve"
nii.numbers.spellout 1,    :common           # => "en"
nii.numbers.spellout 115,  :ordinal, :common # => "hundrede og femtende"
nii.numbers.spellout 115,  :ordinal, :neuter # => "hundrede og femtende"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Danish</td>
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
      <td>eftermiddag</td>
      <td>12:00 to 18:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>aften</td>
      <td>18:00 to 24:00</td>
    </tr>
    <tr>
      <td>midnight</td>
      <td>midnight</td>
      <td>midnat</td>
      <td>at 00:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>morgen</td>
      <td>05:00 to 10:00</td>
    </tr>
    <tr>
      <td>morning2</td>
      <td>morning</td>
      <td>formiddag</td>
      <td>10:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>nat</td>
      <td>00:00 to 05:00</td>
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
      <td><code>bornholm</code></td>
      <td>Bornholmsk</td>
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
      <td><code>da-DK</code></td>
      <td>Danish (Denmark)</td>
      <td><code>da</code> and <code>dan</code></td>
    </tr>
    <tr>
      <td><code>da-GL</code></td>
      <td>Danish (Greenland)</td>
      <td></td>
    </tr>
  </tbody>
</table>

