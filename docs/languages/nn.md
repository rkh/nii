<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Norwegian Nynorsk

## Installation

You do not need any additional libraries to use Norwegian Nynorsk with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Norwegian Nynorsk
nii = Nii::Context.new "nn" # => #<Nii::Context:nn-NO>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 kr"
nii.format Nii::Territory["NO"]              # => "Noreg"
nii.format ["de", "fr", "it"], as: :language # => "tysk, fransk og italiensk"

# Spelling out numbers
nii.spellout 115                 # => "eitt hundre og femten"
nii.spellout 1                   # => "éin"
nii.spellout 2020                # => "to tusen og tjue"
nii.spellout 2020, rule: :year   # => "tjue hundre og tjue"
nii.spellout 1,    rule: :neuter # => "eitt"

# With RubyMoney
price = Money.eur 15_00
nii.format   price # => "15,00 €"
nii.spellout price # => "femten euro"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Norwegian Nynorsk</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>f.m.</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>e.m.</td>
      <td>12:00 to 24:00</td>
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
      <td><code>hognorsk</code></td>
      <td>Norwegian in Høgnorsk (High Norwegian) orthography</td>
      <td>Norwegian following Ivar Aasen's orthographical principles, including modern usage.</td>
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
      <td><code>nn-NO</code></td>
      <td>Norwegian Nynorsk (Norway)</td>
      <td><code>nn</code>, <code>nno</code>, <code>no-nyn</code>, and <code>no-nynorsk</code></td>
    </tr>
  </tbody>
</table>

