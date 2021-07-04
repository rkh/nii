<!-- This file has been generated. Source: languages/_template.md.erb -->

# Malayalam

## Installation

You do not need any additional libraries to use Malayalam with Nii.
However, you do need to install `nii-extra-locales` in order to use Malayalam (Arabic).
See the [list of locales](#locales) below.

## Example Usage

``` ruby
# Create a context for Malayalam
nii = Nii::Context.new "ml" # => #<Nii::Context:ml-IN>

# Value formatting
nii.format 9.99, style: :currency            # => "₹9.99"
nii.format Nii::Territory["IN"]              # => "ഇന്ത്യ"
nii.format ["de", "fr", "it"], as: :language # => "ജർമ്മൻ, ഫ്രഞ്ച്, ഇറ്റാലിയൻ എന്നിവ"
```


## Locales

<table>
  <thead>
    <tr>
      <th>Locale Tag</th>
      <th>Library</th>
      <th>Description</th>
      <th>Aliases</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>ml-Arab</code></td>
      <td><code>nii-extra-locales</code></td>
      <td>Malayalam (Arabic)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ml-IN</code></td>
      <td><code>nii-core</code></td>
      <td>Malayalam (India)</td>
      <td><code>ml</code> and <code>mal</code></td>
    </tr>
  </tbody>
</table>

