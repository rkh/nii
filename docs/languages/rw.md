<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Kinyarwanda

## Installation

In order to use Kinyarwanda with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Kinyarwanda
nii = Nii::Context.new "rw" # => #<Nii::Context:rw-RW>

# Value formatting
nii.format 9.99, style: :currency            # => "RF 9,99"
nii.format Nii::Territory["RW"]              # => "U Rwanda"
nii.format ["de", "fr", "it"], as: :language # => "Ikidage, Igifaransa, Igitaliyani"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Kinyarwanda</td>
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
      <td><code>rw-RW</code></td>
      <td>Kinyarwanda (Rwanda)</td>
      <td><code>rw</code> and <code>kin</code></td>
    </tr>
  </tbody>
</table>

