<!-- This file has been generated. Source: languages/_template.md.erb -->

# Sindhi

## Installation

You do not need any additional libraries to use Sindhi with Nii.
However, you do need to install `nii-extra-locales` in order to use Sindhi (Devanagari), Sindhi (Khojki), or Sindhi (Khudawadi).
See the [list of locales](#locales) below.

## Example Usage

``` ruby
# Create a context for Sindhi
nii = Nii::Context.new "sd" # => #<Nii::Context:sd-Deva-IN>

# Value formatting
nii.format 9.99, style: :currency            # => "٩٫٩٩ ₹"
nii.format Nii::Territory["IN"]              # => "भारत"
nii.format ["de", "fr", "it"], as: :language # => "जर्मन, फ़्रांस जी ॿोली، ۽ इटालियनु"
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
      <td><code>sd-Arab</code></td>
      <td><code>nii-core</code></td>
      <td>Sindhi (Arabic)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>sd-Arab-PK</code></td>
      <td><code>nii-core</code></td>
      <td>Sindhi (Arabic, Pakistan)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>sd-Deva-IN</code></td>
      <td><code>nii-core</code></td>
      <td>Sindhi (Devanagari, India)</td>
      <td><code>sd</code> and <code>snd</code></td>
    </tr>
    <tr>
      <td><code>sd-Deva</code></td>
      <td><code>nii-extra-locales</code></td>
      <td>Sindhi (Devanagari)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>sd-Khoj</code></td>
      <td><code>nii-extra-locales</code></td>
      <td>Sindhi (Khojki)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>sd-Sind</code></td>
      <td><code>nii-extra-locales</code></td>
      <td>Sindhi (Khudawadi)</td>
      <td></td>
    </tr>
  </tbody>
</table>
