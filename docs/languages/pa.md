<!-- This file has been generated. Source: languages/_template.md.erb -->

# Punjabi

## Installation

You do not need any additional libraries to use Punjabi with Nii.
However, you do need to install `nii-extra-locales` in order to use Punjabi (Arabic).
See the [list of locales](#locales) below.

## Example Usage

``` ruby
# Create a context for Punjabi
nii = Nii::Context.new "pa" # => #<Nii::Context:pa-Guru-IN>

# Value formatting
nii.format 9.99, style: :currency            # => "₹ 9.99"
nii.format Nii::Territory["IN"]              # => "ਭਾਰਤ"
nii.format ["de", "fr", "it"], as: :language # => "ਜਰਮਨ, ਫਰਾਂਸੀਸੀ ਅਤੇ ਇਤਾਲਵੀ"
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
      <td><code>pa-Arab</code></td>
      <td><code>nii-extra-locales</code></td>
      <td>Punjabi (Arabic)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>pa-Arab-PK</code></td>
      <td><code>nii-core</code></td>
      <td>Punjabi (Arabic, Pakistan)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>pa-Guru</code></td>
      <td><code>nii-core</code></td>
      <td>Punjabi (Gurmukhi)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>pa-Guru-IN</code></td>
      <td><code>nii-core</code></td>
      <td>Punjabi (Gurmukhi, India)</td>
      <td><code>pa</code> and <code>pan</code></td>
    </tr>
  </tbody>
</table>

