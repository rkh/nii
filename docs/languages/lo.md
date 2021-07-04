<!-- This file has been generated. Source: languages/_template.md.erb -->

# Lao

## Installation

You do not need any additional libraries to use Lao with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Lao
nii = Nii::Context.new "lo" # => #<Nii::Context:lo-LA>

# Value formatting
nii.format 9.99, style: :currency            # => "₭9,99"
nii.format Nii::Territory["LA"]              # => "ລາວ"
nii.format ["de", "fr", "it"], as: :language # => "ເຢຍລະມັນ, ຝຣັ່ງ, ອິຕາລຽນ"
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
      <td><code>lo-LA</code></td>
      <td>Lao (Laos)</td>
      <td><code>lo</code> and <code>lao</code></td>
    </tr>
  </tbody>
</table>

