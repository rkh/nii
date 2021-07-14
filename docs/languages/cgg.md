<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Chiga

## Installation

In order to use Chiga with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Chiga
nii = Nii::Context.new "cgg" # => #<Nii::Context:cgg-UG>

# Value formatting
nii.format 9.99, style: :currency            # => "USh 9.99"
nii.format Nii::Territory["UG"]              # => "Uganda"
nii.format ["de", "fr", "it"], as: :language # => "Orugirimaani, Orufaransa, Oruyitare"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Chiga</td>
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
      <td><code>cgg-UG</code></td>
      <td>Chiga (Uganda)</td>
      <td><code>cgg</code></td>
    </tr>
  </tbody>
</table>

