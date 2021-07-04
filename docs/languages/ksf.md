<!-- This file has been generated. Source: languages/_template.md.erb -->

# Bafia

## Installation

In order to use Bafia with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Bafia
nii = Nii::Context.new "ksf" # => #<Nii::Context:ksf-CM>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 FCFA"
nii.format Nii::Territory["CM"]              # => "kamɛrún"
nii.format ["de", "fr", "it"], as: :language # => "ridjɛrman, ripɛrɛsǝ́, riitalyɛ́n"
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
      <td><code>ksf-CM</code></td>
      <td>Bafia (Cameroon)</td>
      <td><code>ksf</code></td>
    </tr>
  </tbody>
</table>

