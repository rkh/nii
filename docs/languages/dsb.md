<!-- This file has been generated. Source: languages/_template.md.erb -->

# Lower Sorbian

## Installation

In order to use Lower Sorbian with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Lower Sorbian
nii = Nii::Context.new "dsb" # => #<Nii::Context:dsb-DE>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 €"
nii.format Nii::Territory["DE"]              # => "Nimska"
nii.format ["de", "fr", "it"], as: :language # => "nimšćina, francojšćina a italšćina"
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
      <td><code>dsb-DE</code></td>
      <td>Lower Sorbian (Germany)</td>
      <td><code>dsb</code></td>
    </tr>
  </tbody>
</table>

