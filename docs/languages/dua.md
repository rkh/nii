<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Duala

## Installation

In order to use Duala with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Duala
nii = Nii::Context.new "dua" # => #<Nii::Context:dua-CM>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 FCFA"
nii.format Nii::Territory["CM"]              # => "Cameroun"
nii.format ["de", "fr", "it"], as: :language # => "de, fr, it"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Duala</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>idiɓa</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>ebyámu</td>
      <td>12:00 to 24:00</td>
    </tr>
  </tbody>
</table>



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
      <td><code>dua-CM</code></td>
      <td>Duala (Cameroon)</td>
      <td><code>dua</code></td>
    </tr>
  </tbody>
</table>

