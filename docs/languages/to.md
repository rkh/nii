<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Tongan

## Installation

In order to use Tongan with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Tongan
nii = Nii::Context.new "to" # => #<Nii::Context:to-TO>

# Value formatting
nii.format 9.99, style: :currency            # => "T$ 9.99"
nii.format Nii::Territory["TO"]              # => "Tonga"
nii.format ["de", "fr", "it"], as: :language # => "lea fakasiamane mo lea fakafalanisē mo lea fakaʻītali"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Tongan</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>HH</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>EA</td>
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
      <td><code>to-TO</code></td>
      <td>Tongan (Tonga)</td>
      <td><code>to</code> and <code>ton</code></td>
    </tr>
  </tbody>
</table>

