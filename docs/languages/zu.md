<!-- This file has been generated. Source: languages/_template.md.erb -->

# Zulu

## Installation

You do not need any additional libraries to use Zulu with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Zulu
nii = Nii::Context.new "zu" # => #<Nii::Context:zu-ZA>

# Value formatting
nii.format 9.99, style: :currency            # => "R 9.99"
nii.format Nii::Territory["ZA"]              # => "iNingizimu Afrika"
nii.format ["de", "fr", "it"], as: :language # => "isi-German, isi-French, ne-isi-Italian"
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
      <td><code>zu-ZA</code></td>
      <td>Zulu (South Africa)</td>
      <td><code>zu</code> and <code>zul</code></td>
    </tr>
  </tbody>
</table>

