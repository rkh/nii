<!-- This file has been generated. Source: languages/_template.md.erb -->

# Manx

## Installation

In order to use Manx with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Manx
nii = Nii::Context.new "gv" # => #<Nii::Context:gv-IM>

# Value formatting
nii.format 9.99, style: :currency            # => "£9.99"
nii.format Nii::Territory["IM"]              # => "Ellan Vannin"
nii.format ["de", "fr", "it"], as: :language # => "de, fr, it"
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
      <td><code>gv-IM</code></td>
      <td>Manx (Isle of Man)</td>
      <td><code>gv</code> and <code>glv</code></td>
    </tr>
  </tbody>
</table>

