<!-- This file has been generated. Source: languages/_template.md.erb -->

# Tajik

## Installation

In order to use Tajik with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Tajik
nii = Nii::Context.new "tg" # => #<Nii::Context:tg-TJ>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 сом."
nii.format Nii::Territory["TJ"]              # => "Тоҷикистон"
nii.format ["de", "fr", "it"], as: :language # => "немисӣ, франсузӣ, италиявӣ"
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
      <td><code>tg-TJ</code></td>
      <td>Tajik (Tajikistan)</td>
      <td><code>tg</code> and <code>tgk</code></td>
    </tr>
    <tr>
      <td><code>tg-Arab</code></td>
      <td>Tajik (Arabic)</td>
      <td></td>
    </tr>
  </tbody>
</table>

