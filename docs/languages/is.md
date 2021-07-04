<!-- This file has been generated. Source: languages/_template.md.erb -->

# Icelandic

## Installation

You do not need any additional libraries to use Icelandic with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Icelandic
nii = Nii::Context.new "is" # => #<Nii::Context:is-IS>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 ISK"
nii.format Nii::Territory["IS"]              # => "Ísland"
nii.format ["de", "fr", "it"], as: :language # => "þýska, franska og ítalska"

# Spelling out numbers
nii.numbers.spellout 1               # => "einn"
nii.numbers.spellout 115             # => "eitt­hundrað og fimmtán"
nii.numbers.spellout 2020            # => "tvö þúsund og tuttugu"
nii.numbers.spellout 2020, :year     # => "tuttugu hundrað og tuttugu"
nii.numbers.spellout 1,    :neuter   # => "eitt"
nii.numbers.spellout 1,    :feminine # => "ein"
```


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
      <td><code>is-IS</code></td>
      <td>Icelandic (Iceland)</td>
      <td><code>is</code>, <code>ice</code>, and <code>isl</code></td>
    </tr>
  </tbody>
</table>

