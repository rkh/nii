<!-- This file has been generated. Source: languages/_template.md.erb -->

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
nii.numbers.spellout 115             # => "еднасто петнаесет"
nii.numbers.spellout 1               # => "еден"
nii.numbers.spellout 2020, :year     # => "две илјада дваесет"
nii.numbers.spellout 1,    :neuter   # => "едно"
nii.numbers.spellout 1,    :feminine # => "една"
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
      <td><code>mk-MK</code></td>
      <td>Macedonian (North Macedonia)</td>
      <td><code>mk</code>, <code>mac</code>, and <code>mkd</code></td>
    </tr>
  </tbody>
</table>

