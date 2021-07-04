<!-- This file has been generated. Source: languages/_template.md.erb -->

# Luyia

## Installation

In order to use Luyia with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Luyia
nii = Nii::Context.new "luy" # => #<Nii::Context:luy-KE>

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
      <td><code>luy-KE</code></td>
      <td>Luyia (Kenya)</td>
      <td><code>luy</code> and <code>bxk</code></td>
    </tr>
  </tbody>
</table>

