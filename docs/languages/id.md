<!-- This file has been generated. Source: languages/_template.md.erb -->

# Indonesian

## Installation

You do not need any additional libraries to use Indonesian with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Indonesian
nii = Nii::Context.new "id" # => #<Nii::Context:id-ID>

# Value formatting
nii.format 9.99, style: :currency            # => "Rp 9,99"
nii.format Nii::Territory["ID"]              # => "Indonesia"
nii.format ["de", "fr", "it"], as: :language # => "Jerman, Prancis, dan Italia"
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
      <td><code>id-ID</code></td>
      <td>Indonesian (Indonesia)</td>
      <td><code>id</code>, <code>in</code>, and <code>ind</code></td>
    </tr>
  </tbody>
</table>

