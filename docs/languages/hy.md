<!-- This file has been generated. Source: languages/_template.md.erb -->

# Armenian

## Installation

You do not need any additional libraries to use Armenian with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Armenian
nii = Nii::Context.new "hy" # => #<Nii::Context:hy-AM>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 ֏"
nii.format Nii::Territory["AM"]              # => "Հայաստան"
nii.format ["de", "fr", "it"], as: :language # => "գերմաներեն, ֆրանսերեն և իտալերեն"

# Spelling out numbers
nii.numbers.spellout 1           # => "մեկ"
nii.numbers.spellout 115         # => "մեկ­հարյուր տասն­հինգ"
nii.numbers.spellout 2020, :year # => "երկու հազար քսան"
```

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
      <td><code>arevela</code></td>
      <td>Eastern Armenian</td>
      <td>Preferred tag is hy</td>
    </tr>
    <tr>
      <td><code>arevmda</code></td>
      <td>Western Armenian</td>
      <td>Preferred tag is hyw</td>
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
      <td><code>hy-AM</code></td>
      <td>Armenian (Armenia)</td>
      <td><code>hy</code>, <code>arm</code>, and <code>hye</code></td>
    </tr>
  </tbody>
</table>

