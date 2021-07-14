<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Shona

## Installation

In order to use Shona with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Shona
nii = Nii::Context.new "sn" # => #<Nii::Context:sn-ZW>

# Value formatting
nii.format 9.99, style: :currency            # => "US$9.99"
nii.format Nii::Territory["ZW"]              # => "Zimbabwe"
nii.format ["de", "fr", "it"], as: :language # => "chiJerimani, chiFurenchi, chiTariana"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Shona</td>
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
      <td><code>sn-ZW</code></td>
      <td>Shona (Zimbabwe)</td>
      <td><code>sn</code> and <code>sna</code></td>
    </tr>
  </tbody>
</table>

