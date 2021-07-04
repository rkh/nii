<!-- This file has been generated. Source: languages/_template.md.erb -->

# Cherokee

## Installation

In order to use Cherokee with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Cherokee
nii = Nii::Context.new "chr" # => #<Nii::Context:chr-US>

# Value formatting
nii.format 9.99, style: :currency            # => "$9.99"
nii.format Nii::Territory["US"]              # => "ᏌᏊ ᎢᏳᎾᎵᏍᏔᏅ ᏍᎦᏚᎩ"
nii.format ["de", "fr", "it"], as: :language # => "ᏙᎢᏥ, ᎦᎸᏥ, ᎠᎴ ᎬᏩᎵᏲᏥᎢ"

# Spelling out numbers
nii.numbers.spellout 115         # => "ꮠꮼ ꮝꭺꭿꮵꮖ ꭿꮝꭶꮪ"
nii.numbers.spellout 1           # => "ꮠꮼ"
nii.numbers.spellout 2020, :year # => "ꮤꮅ ꭲꮿꭶᏼꮅ ꮤꮅꮝꭺꭿ"
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
      <td><code>chr-US</code></td>
      <td>Cherokee (United States)</td>
      <td><code>chr</code></td>
    </tr>
  </tbody>
</table>

