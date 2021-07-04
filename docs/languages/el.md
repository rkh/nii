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
nii.numbers.spellout 115                        # => "εκατόν δεκα­πέντε"
nii.numbers.spellout 1                          # => "ένα"
nii.numbers.spellout 2020, :year                # => "δύο χίλιάδες είκοσι"
nii.numbers.spellout 1,    :masculine           # => "ένας"
nii.numbers.spellout 1,    :feminine            # => "μία"
nii.numbers.spellout 115,  :ordinal, :masculine # => "εκατοστός δέκατος πέμπτος"
nii.numbers.spellout 115,  :ordinal, :feminine  # => "εκατοστή δέκατη πέμπτη"
nii.numbers.spellout 115,  :ordinal, :neuter    # => "εκατοστό δέκατο πέμπτο"
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

