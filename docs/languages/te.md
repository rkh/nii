<!-- This file has been generated. Source: languages/_template.md.erb -->

# Telugu

## Installation

You do not need any additional libraries to use Telugu with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Telugu
nii = Nii::Context.new "te" # => #<Nii::Context:te-IN>

# Value formatting
nii.format 9.99, style: :currency            # => "₹9.99"
nii.format Nii::Territory["IN"]              # => "భారతదేశం"
nii.format ["de", "fr", "it"], as: :language # => "జర్మన్, ఫ్రెంచ్ మరియు ఇటాలియన్"
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
      <td><code>te-IN</code></td>
      <td>Telugu (India)</td>
      <td><code>te</code> and <code>tel</code></td>
    </tr>
  </tbody>
</table>

