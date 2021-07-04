<!-- This file has been generated. Source: languages/_template.md.erb -->

# Samburu

## Installation

In order to use Samburu with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Samburu
nii = Nii::Context.new "saq" # => #<Nii::Context:saq-KE>

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
      <td><code>saq-KE</code></td>
      <td>Samburu (Kenya)</td>
      <td><code>saq</code></td>
    </tr>
  </tbody>
</table>

