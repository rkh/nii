<!-- This file has been generated. Source: languages/_template.md.erb -->

# Ewondo

## Installation

In order to use Ewondo with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Ewondo
nii = Nii::Context.new "ewo" # => #<Nii::Context:ewo-CM>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 FCFA"
nii.format Nii::Territory["CM"]              # => "Kamərún"
nii.format ["de", "fr", "it"], as: :language # => "Ǹkɔ́bɔ ndzáman, Ǹkɔ́bɔ fulɛnsí, Ǹkɔ́bɔ etáliɛn"
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
      <td><code>ewo-CM</code></td>
      <td>Ewondo (Cameroon)</td>
      <td><code>ewo</code></td>
    </tr>
  </tbody>
</table>

