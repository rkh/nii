<!-- This file has been generated. Source: languages/_template.md.erb -->

# Kurdish

## Installation

In order to use Kurdish with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Kurdish
nii = Nii::Context.new "ku" # => #<Nii::Context:ku-TR>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 ₺"
nii.format Nii::Territory["TR"]              # => "Tirkiye"
nii.format ["de", "fr", "it"], as: :language # => "elmanî, frensî û îtalî"
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
      <td><code>ku-TR</code></td>
      <td>Kurdish (Turkey)</td>
      <td><code>ku</code>, <code>kmr</code>, and <code>kur</code></td>
    </tr>
    <tr>
      <td><code>ku-Arab</code></td>
      <td>Kurdish (Arabic)</td>
      <td></td>
    </tr>
  </tbody>
</table>

