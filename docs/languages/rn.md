<!-- This file has been generated. Source: languages/_template.md.erb -->

# Rundi

## Installation

In order to use Rundi with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Rundi
nii = Nii::Context.new "rn" # => #<Nii::Context:rn-BI>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 FBu"
nii.format Nii::Territory["BI"]              # => "Uburundi"
nii.format ["de", "fr", "it"], as: :language # => "Ikidage, Igifaransa, Igitaliyani"
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
      <td><code>rn-BI</code></td>
      <td>Rundi (Burundi)</td>
      <td><code>rn</code> and <code>run</code></td>
    </tr>
  </tbody>
</table>

