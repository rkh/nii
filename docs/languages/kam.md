<!-- This file has been generated. Source: languages/_template.md.erb -->

# Kamba

## Installation

In order to use Kamba with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Kamba
nii = Nii::Context.new "kam" # => #<Nii::Context:kam-KE>

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
      <td><code>kam-KE</code></td>
      <td>Kamba (Kenya)</td>
      <td><code>kam</code></td>
    </tr>
  </tbody>
</table>

