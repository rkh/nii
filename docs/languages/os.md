<!-- This file has been generated. Source: languages/_template.md.erb -->

# Ossetic

## Installation

In order to use Ossetic with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Ossetic
nii = Nii::Context.new "os" # => #<Nii::Context:os-GE>

# Value formatting
nii.format 9.99, style: :currency            # => "₾ 9,99"
nii.format Nii::Territory["GE"]              # => "Гуырдзыстон"
nii.format ["de", "fr", "it"], as: :language # => "немыцаг, францаг ӕмӕ италиаг"
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
      <td><code>os-GE</code></td>
      <td>Ossetic (Georgia)</td>
      <td><code>os</code> and <code>oss</code></td>
    </tr>
    <tr>
      <td><code>os-RU</code></td>
      <td>Ossetic (Russia)</td>
      <td></td>
    </tr>
  </tbody>
</table>
