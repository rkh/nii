<!-- This file has been generated. Source: languages/_template.md.erb -->

# Afrikaans

## Installation

You do not need any additional libraries to use Afrikaans with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Afrikaans
nii = Nii::Context.new "af" # => #<Nii::Context:af-ZA>

# Value formatting
nii.format 9.99, style: :currency            # => "R 9,99"
nii.format Nii::Territory["ZA"]              # => "Suid-Afrika"
nii.format ["de", "fr", "it"], as: :language # => "Duits, Frans en Italiaans"
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
      <td><code>af-NA</code></td>
      <td>Afrikaans (Namibia)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>af-ZA</code></td>
      <td>Afrikaans (South Africa)</td>
      <td><code>af</code> and <code>afr</code></td>
    </tr>
  </tbody>
</table>

