<!-- This file has been generated. Source: languages/_template.md.erb -->

# Lingala

## Installation

In order to use Lingala with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Lingala
nii = Nii::Context.new "ln" # => #<Nii::Context:ln-CD>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 FC"
nii.format Nii::Territory["CD"]              # => "Republíki ya Kongó Demokratíki"
nii.format ["de", "fr", "it"], as: :language # => "lialemá, lifalansɛ́, litaliano"
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
      <td><code>ln-AO</code></td>
      <td>Lingala (Angola)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ln-CD</code></td>
      <td>Lingala (Congo - Kinshasa)</td>
      <td><code>ln</code> and <code>lin</code></td>
    </tr>
    <tr>
      <td><code>ln-CF</code></td>
      <td>Lingala (Central African Republic)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ln-CG</code></td>
      <td>Lingala (Congo - Brazzaville)</td>
      <td></td>
    </tr>
  </tbody>
</table>

