<!-- This file has been generated. Source: languages/_template.md.erb -->

# Norwegian

## Installation

You do not need any additional libraries to use Norwegian with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Norwegian
nii = Nii::Context.new "no" # => #<Nii::Context:no-001>

# Value formatting
nii.format 9.99, currency: "USD"             # => "USD 9,99"
nii.format Nii::Territory["001"]             # => "verden"
nii.format ["de", "fr", "it"], as: :language # => "tysk, fransk og italiensk"
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
      <td><code>no</code></td>
      <td>Norwegian</td>
      <td><code>nor</code></td>
    </tr>
  </tbody>
</table>

