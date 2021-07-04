<!-- This file has been generated. Source: languages/_template.md.erb -->

# Kalenjin

## Installation

In order to use Kalenjin with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Kalenjin
nii = Nii::Context.new "kln" # => #<Nii::Context:kln-KE>

# Value formatting
nii.format 9.99, style: :currency            # => "Ksh 9.99"
nii.format Nii::Territory["KE"]              # => "Emetab Kenya"
nii.format ["de", "fr", "it"], as: :language # => "kutitab Chermani, kutitab Kifaransa, kutitab Talianek"
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
      <td><code>kln-KE</code></td>
      <td>Kalenjin (Kenya)</td>
      <td><code>kln</code> and <code>spy</code></td>
    </tr>
  </tbody>
</table>

