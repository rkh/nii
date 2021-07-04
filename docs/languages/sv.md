<!-- This file has been generated. Source: languages/_template.md.erb -->

# Swedish

## Installation

You do not need any additional libraries to use Swedish with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Swedish
nii = Nii::Context.new "sv" # => #<Nii::Context:sv-SE>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 kr"
nii.format Nii::Territory["SE"]              # => "Sverige"
nii.format ["de", "fr", "it"], as: :language # => "tyska, franska och italienska"
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
      <td><code>sv-AX</code></td>
      <td>Swedish (Åland Islands)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>sv-FI</code></td>
      <td>Swedish (Finland)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>sv-SE</code></td>
      <td>Swedish (Sweden)</td>
      <td><code>sv</code> and <code>swe</code></td>
    </tr>
  </tbody>
</table>

