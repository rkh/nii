<!-- This file has been generated. Source: languages/_template.md.erb -->

# Luxembourgish

## Installation

In order to use Luxembourgish with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Luxembourgish
nii = Nii::Context.new "lb" # => #<Nii::Context:lb-LU>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 €"
nii.format Nii::Territory["LU"]              # => "Lëtzebuerg"
nii.format ["de", "fr", "it"], as: :language # => "Däitsch, Franséisch a(n) Italienesch"
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
      <td><code>lb-LU</code></td>
      <td>Luxembourgish (Luxembourg)</td>
      <td><code>lb</code>, <code>i-lux</code>, and <code>ltz</code></td>
    </tr>
  </tbody>
</table>

