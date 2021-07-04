<!-- This file has been generated. Source: languages/_template.md.erb -->

# Amharic

## Installation

You do not need any additional libraries to use Amharic with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Amharic
nii = Nii::Context.new "am" # => #<Nii::Context:am-ET>

# Value formatting
nii.format 9.99, style: :currency            # => "ብር 9.99"
nii.format Nii::Territory["ET"]              # => "ኢትዮጵያ"
nii.format ["de", "fr", "it"], as: :language # => "ጀርመን፣ ፈረንሳይኛ, እና ጣሊያንኛ"
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
      <td><code>am-ET</code></td>
      <td>Amharic (Ethiopia)</td>
      <td><code>am</code> and <code>amh</code></td>
    </tr>
  </tbody>
</table>

