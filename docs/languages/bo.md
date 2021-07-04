<!-- This file has been generated. Source: languages/_template.md.erb -->

# Tibetan

## Installation

In order to use Tibetan with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Tibetan
nii = Nii::Context.new "bo" # => #<Nii::Context:bo-CN>

# Value formatting
nii.format 9.99, style: :currency            # => "¥ 9.99"
nii.format Nii::Territory["CN"]              # => "རྒྱ་ནག"
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
      <td><code>bo-CN</code></td>
      <td>Tibetan (China)</td>
      <td><code>bo</code>, <code>bod</code>, and <code>tib</code></td>
    </tr>
    <tr>
      <td><code>bo-IN</code></td>
      <td>Tibetan (India)</td>
      <td></td>
    </tr>
  </tbody>
</table>

