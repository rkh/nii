<!-- This file has been generated. Source: languages/_template.md.erb -->

# Georgian

## Installation

You do not need any additional libraries to use Georgian with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Georgian
nii = Nii::Context.new "ka" # => #<Nii::Context:ka-GE>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 ₾"
nii.format Nii::Territory["GE"]              # => "საქართველო"
nii.format ["de", "fr", "it"], as: :language # => "გერმანული, ფრანგული და იტალიური"

# Spelling out numbers
nii.numbers.spellout 115         # => "ას­თხუთმეტი"
nii.numbers.spellout 1           # => "ერთი"
nii.numbers.spellout 2020, :year # => "ორი ათას ოცი"
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
      <td><code>ka-GE</code></td>
      <td>Georgian (Georgia)</td>
      <td><code>ka</code>, <code>geo</code>, and <code>kat</code></td>
    </tr>
  </tbody>
</table>

