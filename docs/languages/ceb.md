<!-- This file has been generated. Source: languages/_template.md.erb -->

# Cebuano

## Installation

In order to use Cebuano with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Cebuano
nii = Nii::Context.new "ceb" # => #<Nii::Context:ceb-PH>

# Value formatting
nii.format 9.99, style: :currency            # => "₱9.99"
nii.format Nii::Territory["PH"]              # => "Pilipinas"
nii.format ["de", "fr", "it"], as: :language # => "Aleman, Pranses, ug Italiano"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Cebuano</td>
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
      <td><code>ceb-PH</code></td>
      <td>Cebuano (Philippines)</td>
      <td><code>ceb</code></td>
    </tr>
  </tbody>
</table>

