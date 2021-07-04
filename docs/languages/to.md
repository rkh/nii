<!-- This file has been generated. Source: languages/_template.md.erb -->

# Tongan

## Installation

In order to use Tongan with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Tongan
nii = Nii::Context.new "to" # => #<Nii::Context:to-TO>

# Value formatting
nii.format 9.99, style: :currency            # => "T$ 9.99"
nii.format Nii::Territory["TO"]              # => "Tonga"
nii.format ["de", "fr", "it"], as: :language # => "lea fakasiamane mo lea fakafalanisē mo lea fakaʻītali"
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
      <td><code>to-TO</code></td>
      <td>Tongan (Tonga)</td>
      <td><code>to</code> and <code>ton</code></td>
    </tr>
  </tbody>
</table>

