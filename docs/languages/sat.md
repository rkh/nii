<!-- This file has been generated. Source: languages/_template.md.erb -->

# Santali

## Installation

In order to use Santali with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Santali
nii = Nii::Context.new "sat" # => #<Nii::Context:sat-Olck-IN>

# Value formatting
nii.format 9.99, style: :currency            # => "₹ ᱙.᱙᱙"
nii.format Nii::Territory["IN"]              # => "ᱤᱱᱰᱤᱭᱟ"
nii.format ["de", "fr", "it"], as: :language # => "ᱡᱟᱨᱢᱟᱱ, ᱯᱷᱨᱮᱧᱪ, ᱤᱴᱟᱞᱤᱟᱱ"
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
      <td><code>sat-Deva</code></td>
      <td>Santali (Devanagari)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>sat-Olck</code></td>
      <td>Santali (Ol Chiki)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>sat-Olck-IN</code></td>
      <td>Santali (Ol Chiki, India)</td>
      <td><code>sat</code></td>
    </tr>
  </tbody>
</table>

