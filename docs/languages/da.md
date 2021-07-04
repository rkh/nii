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
nii.numbers.spellout 1                       # => "et"
nii.numbers.spellout 115                     # => "hundrede og femten"
nii.numbers.spellout 2020                    # => "to tusind og tyve"
nii.numbers.spellout 2020, :year             # => "tyve­hundrede og tyve"
nii.numbers.spellout 1,    :common           # => "en"
nii.numbers.spellout 1,    :ordinal, :common # => "første"
nii.numbers.spellout 115,  :ordinal, :common # => "hundrede og femtende"
nii.numbers.spellout 1,    :ordinal, :neuter # => "første"
nii.numbers.spellout 115,  :ordinal, :neuter # => "hundrede og femtende"
```

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

