<!-- This file has been generated. Source: languages/_template.md.erb -->

# Luba-Katanga

## Installation

In order to use Luba-Katanga with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Luba-Katanga
nii = Nii::Context.new "lu" # => #<Nii::Context:lu-CD>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 FC"
nii.format Nii::Territory["CD"]              # => "Ditunga wa Kongu"
nii.format ["de", "fr", "it"], as: :language # => "Lizelumani, Mfwàlànsa, Litali"
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
      <td><code>lu-CD</code></td>
      <td>Luba-Katanga (Congo - Kinshasa)</td>
      <td><code>lu</code> and <code>lub</code></td>
    </tr>
  </tbody>
</table>

