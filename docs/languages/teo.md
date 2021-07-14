<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Teso

## Installation

In order to use Teso with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Teso
nii = Nii::Context.new "teo" # => #<Nii::Context:teo-UG>

# Value formatting
nii.format 9.99, style: :currency            # => "USh 9.99"
nii.format Nii::Territory["UG"]              # => "Uganda"
nii.format ["de", "fr", "it"], as: :language # => "Kijerumani, Kifaransa, Kiitaliano"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Teso</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>Taparachu</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>Ebongi</td>
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
      <td><code>teo-KE</code></td>
      <td>Teso (Kenya)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>teo-UG</code></td>
      <td>Teso (Uganda)</td>
      <td><code>teo</code></td>
    </tr>
  </tbody>
</table>

