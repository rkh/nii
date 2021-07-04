<!-- This file has been generated. Source: languages/_template.md.erb -->

# Kako

## Installation

In order to use Kako with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Kako
nii = Nii::Context.new "kkj" # => #<Nii::Context:kkj-CM>

# Value formatting
nii.format 9.99, style: :currency            # => "FCFA 9,99"
nii.format Nii::Territory["CM"]              # => "Kamɛrun"
nii.format ["de", "fr", "it"], as: :language # => "de, numbu buy, it"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Kako</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>AM</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>PM</td>
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
      <td><code>kkj-CM</code></td>
      <td>Kako (Cameroon)</td>
      <td><code>kkj</code></td>
    </tr>
  </tbody>
</table>

