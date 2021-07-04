<!-- This file has been generated. Source: languages/_template.md.erb -->

# Maithili

## Installation

In order to use Maithili with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Maithili
nii = Nii::Context.new "mai" # => #<Nii::Context:mai-IN>

# Value formatting
nii.format 9.99, style: :currency            # => "₹ 9.99"
nii.format Nii::Territory["IN"]              # => "भारत"
nii.format ["de", "fr", "it"], as: :language # => "जर्मन, फ़्रेंच, और इतालवी"
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
      <td><code>mai-IN</code></td>
      <td>Maithili (India)</td>
      <td><code>mai</code></td>
    </tr>
  </tbody>
</table>

