<!-- This file has been generated. Source: languages/_template.md.erb -->

# Swahili

## Installation

You do not need any additional libraries to use Swahili with Nii.
However, you do need to install `nii-extra-locales` in order to use Swahili (Arabic).
See the [list of locales](#locales) below.

## Example Usage

``` ruby
# Create a context for Swahili
nii = Nii::Context.new "sw" # => #<Nii::Context:sw-TZ>

# Value formatting
nii.format 9.99, style: :currency            # => "TSh 9.99"
nii.format Nii::Territory["TZ"]              # => "Tanzania"
nii.format ["de", "fr", "it"], as: :language # => "Kijerumani, Kifaransa na Kiitaliano"
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
      <td><code>sw-Arab</code></td>
      <td><code>nii-extra-locales</code></td>
      <td>Swahili (Arabic)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>sw-CD</code></td>
      <td><code>nii-core</code></td>
      <td>Congo Swahili</td>
      <td><code>swc</code></td>
    </tr>
    <tr>
      <td><code>sw-KE</code></td>
      <td><code>nii-core</code></td>
      <td>Swahili (Kenya)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>sw-TZ</code></td>
      <td><code>nii-core</code></td>
      <td>Swahili (Tanzania)</td>
      <td><code>sw</code>, <code>swa</code>, and <code>swh</code></td>
    </tr>
    <tr>
      <td><code>sw-UG</code></td>
      <td><code>nii-core</code></td>
      <td>Swahili (Uganda)</td>
      <td></td>
    </tr>
  </tbody>
</table>

