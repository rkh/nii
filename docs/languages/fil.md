<!-- This file has been generated. Source: languages/_template.md.erb -->

# Filipino

## Installation

You do not need any additional libraries to use Filipino with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Filipino
nii = Nii::Context.new "fil" # => #<Nii::Context:fil-PH>

# Value formatting
nii.format 9.99, style: :currency            # => "₱9.99"
nii.format Nii::Territory["PH"]              # => "Pilipinas"
nii.format ["de", "fr", "it"], as: :language # => "German, French, at Italian"
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
      <td><code>fil-PH</code></td>
      <td>Filipino (Philippines)</td>
      <td><code>fil</code>, <code>tgl</code>, and <code>tl</code></td>
    </tr>
  </tbody>
</table>

