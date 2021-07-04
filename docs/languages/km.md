<!-- This file has been generated. Source: languages/_template.md.erb -->

# Khmer

## Installation

You do not need any additional libraries to use Khmer with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Khmer
nii = Nii::Context.new "km" # => #<Nii::Context:km-KH>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99៛"
nii.format Nii::Territory["KH"]              # => "កម្ពុជា"
nii.format ["de", "fr", "it"], as: :language # => "អាល្លឺម៉ង់, បារាំង និង អ៊ីតាលី"
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
      <td><code>km-KH</code></td>
      <td>Khmer (Cambodia)</td>
      <td><code>km</code> and <code>khm</code></td>
    </tr>
  </tbody>
</table>

