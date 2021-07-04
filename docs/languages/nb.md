<!-- This file has been generated. Source: languages/_template.md.erb -->

# Norwegian Bokmål

## Installation

You do not need any additional libraries to use Norwegian Bokmål with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Norwegian Bokmål
nii = Nii::Context.new "nb" # => #<Nii::Context:nb-NO>

# Value formatting
nii.format 9.99, style: :currency            # => "kr 9,99"
nii.format Nii::Territory["NO"]              # => "Norge"
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
      <td><code>nb-NO</code></td>
      <td>Norwegian Bokmål (Norway)</td>
      <td><code>nb</code>, <code>no-bok</code>, <code>no-bokmal</code>, and <code>nob</code></td>
    </tr>
    <tr>
      <td><code>nb-SJ</code></td>
      <td>Norwegian Bokmål (Svalbard &amp; Jan Mayen)</td>
      <td></td>
    </tr>
  </tbody>
</table>

