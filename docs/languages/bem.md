<!-- This file has been generated. Source: languages/_template.md.erb -->

# Bemba

## Installation

In order to use Bemba with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Bemba
nii = Nii::Context.new "bem" # => #<Nii::Context:bem-ZM>

# Value formatting
nii.format 9.99, style: :currency            # => "K 9.99"
nii.format Nii::Territory["ZM"]              # => "Zambia"
nii.format ["de", "fr", "it"], as: :language # => "Ichi Jemani, Ichi Frenchi, Ichi Italiani"
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
      <td><code>bem-ZM</code></td>
      <td>Bemba (Zambia)</td>
      <td><code>bem</code></td>
    </tr>
  </tbody>
</table>

