<!-- This file has been generated. Source: languages/_template.md.erb -->

# Maori

## Installation

In order to use Maori with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Maori
nii = Nii::Context.new "mi" # => #<Nii::Context:mi-NZ>

# Value formatting
nii.format 9.99, style: :currency            # => "$ 9.99"
nii.format Nii::Territory["NZ"]              # => "Aotearoa"
nii.format ["de", "fr", "it"], as: :language # => "Tiamana, Wīwī, Ītariana"
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
      <td><code>mi-NZ</code></td>
      <td>Maori (New Zealand)</td>
      <td><code>mi</code>, <code>mao</code>, and <code>mri</code></td>
    </tr>
  </tbody>
</table>

