<!-- This file has been generated. Source: languages/_template.md.erb -->

# Nyankole

## Installation

In order to use Nyankole with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Nyankole
nii = Nii::Context.new "nyn" # => #<Nii::Context:nyn-UG>

# Value formatting
nii.format 9.99, style: :currency            # => "USh 9.99"
nii.format Nii::Territory["UG"]              # => "Uganda"
nii.format ["de", "fr", "it"], as: :language # => "Orugirimaani, Orufaransa, Oruyitare"
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
      <td><code>nyn-UG</code></td>
      <td>Nyankole (Uganda)</td>
      <td><code>nyn</code></td>
    </tr>
  </tbody>
</table>

