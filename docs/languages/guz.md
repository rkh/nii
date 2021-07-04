<!-- This file has been generated. Source: languages/_template.md.erb -->

# Gusii

## Installation

In order to use Gusii with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Gusii
nii = Nii::Context.new "guz" # => #<Nii::Context:guz-KE>

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
      <td><code>guz-KE</code></td>
      <td>Gusii (Kenya)</td>
      <td><code>guz</code></td>
    </tr>
  </tbody>
</table>

