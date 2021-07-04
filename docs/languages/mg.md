<!-- This file has been generated. Source: languages/_template.md.erb -->

# Malagasy

## Installation

In order to use Malagasy with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Malagasy
nii = Nii::Context.new "mg" # => #<Nii::Context:mg-MG>

# Value formatting
nii.format 9.99, style: :currency            # => "Ar 9.99"
nii.format Nii::Territory["MG"]              # => "Madagasikara"
nii.format ["de", "fr", "it"], as: :language # => "Alemanina, Frantsay, Italianina"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Malagasy</td>
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
      <td><code>mg-MG</code></td>
      <td>Malagasy (Madagascar)</td>
      <td><code>mg</code>, <code>mlg</code>, and <code>plt</code></td>
    </tr>
  </tbody>
</table>

