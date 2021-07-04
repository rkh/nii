<!-- This file has been generated. Source: languages/_template.md.erb -->

# Japanese

## Installation

You do not need any additional libraries to use Japanese with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Japanese
nii = Nii::Context.new "ja" # => #<Nii::Context:ja-JP>

# Value formatting
nii.format 9.99, style: :currency            # => "￥9.99"
nii.format Nii::Territory["JP"]              # => "日本"
nii.format ["de", "fr", "it"], as: :language # => "ドイツ語、フランス語、イタリア語"
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
      <td><code>ja-JP</code></td>
      <td>Japanese (Japan)</td>
      <td><code>ja</code> and <code>jpn</code></td>
    </tr>
  </tbody>
</table>

