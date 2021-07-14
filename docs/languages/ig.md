<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Igbo

## Installation

In order to use Igbo with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Igbo
nii = Nii::Context.new "ig" # => #<Nii::Context:ig-NG>

# Value formatting
nii.format 9.99, style: :currency            # => "₦9.99"
nii.format Nii::Territory["NG"]              # => "Naịjịrịa"
nii.format ["de", "fr", "it"], as: :language # => "Jamanị, Fụrenchị, na Italịanu"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Igbo</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>A.M.</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>P.M.</td>
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
      <td><code>ig-NG</code></td>
      <td>Igbo (Nigeria)</td>
      <td><code>ig</code> and <code>ibo</code></td>
    </tr>
  </tbody>
</table>

