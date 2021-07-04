<!-- This file has been generated. Source: languages/_template.md.erb -->

# Estonian

## Installation

You do not need any additional libraries to use Estonian with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Estonian
nii = Nii::Context.new "et" # => #<Nii::Context:et-EE>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 €"
nii.format Nii::Territory["EE"]              # => "Eesti"
nii.format ["de", "fr", "it"], as: :language # => "saksa, prantsuse ja itaalia"

# Spelling out numbers
nii.numbers.spellout 115         # => "ükssada viisteist"
nii.numbers.spellout 1           # => "üks"
nii.numbers.spellout 2020        # => "kaks tuhat kakskümmend"
nii.numbers.spellout 2020, :year # => "kakskümmend sada kakskümmend"
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
      <td><code>et-EE</code></td>
      <td>Estonian (Estonia)</td>
      <td><code>et</code>, <code>ekk</code>, and <code>est</code></td>
    </tr>
  </tbody>
</table>

