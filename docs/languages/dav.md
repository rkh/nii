<!-- This file has been generated. Source: languages/_template.md.erb -->

# Taita

## Installation

In order to use Taita with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Taita
nii = Nii::Context.new "dav" # => #<Nii::Context:dav-KE>

# Value formatting
nii.format 9.99, style: :currency            # => "Ksh 9.99"
nii.format Nii::Territory["KE"]              # => "Kenya"
nii.format ["de", "fr", "it"], as: :language # => "Kijerumani, Kifaransa, Kiitaliano"
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
      <td><code>dav-KE</code></td>
      <td>Taita (Kenya)</td>
      <td><code>dav</code></td>
    </tr>
  </tbody>
</table>

