<!-- This file has been generated. Source: languages/_template.md.erb -->

# Kikuyu

## Installation

In order to use Kikuyu with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Kikuyu
nii = Nii::Context.new "ki" # => #<Nii::Context:ki-KE>

# Value formatting
nii.format 9.99, style: :currency            # => "Ksh 9.99"
nii.format Nii::Territory["KE"]              # => "Kenya"
nii.format ["de", "fr", "it"], as: :language # => "Kĩnjeremani, Kĩbaranja, Kĩtaliano"
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
      <td><code>ki-KE</code></td>
      <td>Kikuyu (Kenya)</td>
      <td><code>ki</code> and <code>kik</code></td>
    </tr>
  </tbody>
</table>

