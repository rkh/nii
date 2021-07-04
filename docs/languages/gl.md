<!-- This file has been generated. Source: languages/_template.md.erb -->

# Galician

## Installation

You do not need any additional libraries to use Galician with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Galician
nii = Nii::Context.new "gl" # => #<Nii::Context:gl-ES>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 €"
nii.format Nii::Territory["ES"]              # => "España"
nii.format ["de", "fr", "it"], as: :language # => "alemán, francés e italiano"
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
      <td><code>ao1990</code></td>
      <td>Portuguese Language Orthographic Agreement of 1990 (Acordo Ortográfico da Língua Portuguesa de 1990)</td>
      <td>Portuguese orthography conventions established in 1990 but not brought into effect until 2009</td>
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
      <td><code>gl-ES</code></td>
      <td>Galician (Spain)</td>
      <td><code>gl</code> and <code>glg</code></td>
    </tr>
  </tbody>
</table>
