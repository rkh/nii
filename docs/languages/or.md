<!-- This file has been generated. Source: languages/_template.md.erb -->

# Odia

## Installation

You do not need any additional libraries to use Odia with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Odia
nii = Nii::Context.new "or" # => #<Nii::Context:or-IN>

# Value formatting
nii.format 9.99, style: :currency            # => "₹9.99"
nii.format Nii::Territory["IN"]              # => "ଭାରତ"
nii.format ["de", "fr", "it"], as: :language # => "ଜର୍ମାନ, ଫରାସୀ, ଓ ଇଟାଲୀୟ"
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
      <td><code>or-IN</code></td>
      <td>Odia (India)</td>
      <td><code>or</code>, <code>ori</code>, and <code>ory</code></td>
    </tr>
  </tbody>
</table>

