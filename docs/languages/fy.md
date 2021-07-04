<!-- This file has been generated. Source: languages/_template.md.erb -->

# Western Frisian

## Installation

In order to use Western Frisian with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Western Frisian
nii = Nii::Context.new "fy" # => #<Nii::Context:fy-NL>

# Value formatting
nii.format 9.99, style: :currency            # => "€ 9,99"
nii.format Nii::Territory["NL"]              # => "Nederlân"
nii.format ["de", "fr", "it"], as: :language # => "Dútsk, Frânsk en Italiaansk"
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
      <td><code>fy-NL</code></td>
      <td>Western Frisian (Netherlands)</td>
      <td><code>fy</code> and <code>fry</code></td>
    </tr>
  </tbody>
</table>

