<!-- This file has been generated. Source: languages/_template.md.erb -->

# Sichuan Yi

## Installation

In order to use Sichuan Yi with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Sichuan Yi
nii = Nii::Context.new "ii" # => #<Nii::Context:ii-CN>

# Value formatting
nii.format 9.99, style: :currency            # => "¥ 9.99"
nii.format Nii::Territory["CN"]              # => "ꍏꇩ"
nii.format ["de", "fr", "it"], as: :language # => "ꄓꇩꉙ, ꃔꇩꉙ, ꑴꄊꆺꉙ"
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
      <td><code>ii-CN</code></td>
      <td>Sichuan Yi (China)</td>
      <td><code>ii</code> and <code>iii</code></td>
    </tr>
  </tbody>
</table>

