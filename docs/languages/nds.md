<!-- This file has been generated. Source: languages/_template.md.erb -->

# Low German

## Installation

In order to use Low German with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Low German
nii = Nii::Context.new "nds" # => #<Nii::Context:nds-DE>

# Value formatting
nii.format 9.99, style: :currency            # => "€ 9.99"
nii.format Nii::Territory["DE"]              # => "DE"
nii.format ["de", "fr", "it"], as: :language # => "de, fr, it"
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
      <td><code>nds-DE</code></td>
      <td>Low German (Germany)</td>
      <td><code>nds</code></td>
    </tr>
    <tr>
      <td><code>nds-NL</code></td>
      <td>Low Saxon</td>
      <td></td>
    </tr>
  </tbody>
</table>

