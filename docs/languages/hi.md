<!-- This file has been generated. Source: languages/_template.md.erb -->

# Hindi

## Installation

You do not need any additional libraries to use Hindi with Nii.
However, you do need to install `nii-extra-locales` in order to use Hindi (Latin).
See the [list of locales](#locales) below.

## Example Usage

``` ruby
# Create a context for Hindi
nii = Nii::Context.new "hi" # => #<Nii::Context:hi-IN>

# Value formatting
nii.format 9.99, style: :currency            # => "₹9.99"
nii.format Nii::Territory["IN"]              # => "भारत"
nii.format ["de", "fr", "it"], as: :language # => "जर्मन, फ़्रेंच, और इतालवी"
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
      <td><code>hi-IN</code></td>
      <td><code>nii-core</code></td>
      <td>Hindi (India)</td>
      <td><code>hi</code> and <code>hin</code></td>
    </tr>
    <tr>
      <td><code>hi-Latn</code></td>
      <td><code>nii-extra-locales</code></td>
      <td>Hindi (Latin)</td>
      <td></td>
    </tr>
  </tbody>
</table>

