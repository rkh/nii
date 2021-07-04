<!-- This file has been generated. Source: languages/_template.md.erb -->

# Catalan

## Installation

You do not need any additional libraries to use Catalan with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Catalan
nii = Nii::Context.new "ca" # => #<Nii::Context:ca-ES>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 €"
nii.format Nii::Territory["ES"]              # => "Espanya"
nii.format ["de", "fr", "it"], as: :language # => "alemany, francès i italià"
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
      <td><code>valencia</code></td>
      <td>Valencian</td>
      <td>Variety spoken in the "Comunidad Valenciana" region of Spain, where it is co-official with Spanish.</td>
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
      <td><code>ca-AD</code></td>
      <td>Catalan (Andorra)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ca-ES</code></td>
      <td>Catalan (Spain)</td>
      <td><code>ca</code> and <code>cat</code></td>
    </tr>
    <tr>
      <td><code>ca-ES-valencia</code></td>
      <td>Catalan (Spain, Valencian)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ca-FR</code></td>
      <td>Catalan (France)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ca-IT</code></td>
      <td>Catalan (Italy)</td>
      <td></td>
    </tr>
  </tbody>
</table>

