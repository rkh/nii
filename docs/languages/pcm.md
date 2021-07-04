<!-- This file has been generated. Source: languages/_template.md.erb -->

# Nigerian Pidgin

## Installation

In order to use Nigerian Pidgin with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Nigerian Pidgin
nii = Nii::Context.new "pcm" # => #<Nii::Context:pcm-NG>

# Value formatting
nii.format 9.99, style: :currency            # => "₦9.99"
nii.format Nii::Territory["NG"]              # => "Naijíria"
nii.format ["de", "fr", "it"], as: :language # => "Jámán Lángwej, Frẹ́nch Lángwej, an Ítáli Lángwej"
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
      <td><code>pcm-NG</code></td>
      <td>Nigerian Pidgin (Nigeria)</td>
      <td><code>pcm</code></td>
    </tr>
  </tbody>
</table>

