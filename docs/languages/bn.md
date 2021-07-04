<!-- This file has been generated. Source: languages/_template.md.erb -->

# Bangla

## Installation

You do not need any additional libraries to use Bangla with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Bangla
nii = Nii::Context.new "bn" # => #<Nii::Context:bn-BD>

# Value formatting
nii.format 9.99, style: :currency            # => "৯.৯৯৳"
nii.format Nii::Territory["BD"]              # => "বাংলাদেশ"
nii.format ["de", "fr", "it"], as: :language # => "জার্মান, ফরাসি এবং ইতালিয়"
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
      <td><code>bn-BD</code></td>
      <td>Bangla (Bangladesh)</td>
      <td><code>bn</code> and <code>ben</code></td>
    </tr>
    <tr>
      <td><code>bn-IN</code></td>
      <td>Bangla (India)</td>
      <td></td>
    </tr>
  </tbody>
</table>

