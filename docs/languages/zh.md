<!-- This file has been generated. Source: languages/_template.md.erb -->

# Chinese

## Installation

You do not need any additional libraries to use Chinese with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Chinese
nii = Nii::Context.new "zh" # => #<Nii::Context:zh-Hant-TW>

# Value formatting
nii.format 9.99, style: :currency            # => "$9.99"
nii.format Nii::Territory["TW"]              # => "台灣"
nii.format ["de", "fr", "it"], as: :language # => "德文、法文和義大利文"
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
      <td><code>zh-Hans</code></td>
      <td>Simplified Chinese</td>
      <td><code>zh-cmn-Hans</code></td>
    </tr>
    <tr>
      <td><code>zh-Hans-CN</code></td>
      <td>Simplified Chinese (China)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>zh-Hans-HK</code></td>
      <td>Simplified Chinese (Hong Kong SAR China)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>zh-Hans-MO</code></td>
      <td>Simplified Chinese (Macao SAR China)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>zh-Hans-SG</code></td>
      <td>Simplified Chinese (Singapore)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>zh-Hant</code></td>
      <td>Traditional Chinese</td>
      <td><code>zh-cmn-Hant</code></td>
    </tr>
    <tr>
      <td><code>zh-Hant-HK</code></td>
      <td>Traditional Chinese (Hong Kong SAR China)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>zh-Hant-MO</code></td>
      <td>Traditional Chinese (Macao SAR China)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>zh-Hant-TW</code></td>
      <td>Traditional Chinese (Taiwan)</td>
      <td><code>zh</code>, <code>chi</code>, <code>cmn</code>, <code>zh-cmn</code>, <code>zh-guoyu</code>, and <code>zho</code></td>
    </tr>
  </tbody>
</table>

