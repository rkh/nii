<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Kabyle

## Installation

In order to use Kabyle with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Kabyle
nii = Nii::Context.new "kab" # => #<Nii::Context:kab-DZ>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 DA"
nii.format Nii::Territory["DZ"]              # => "Lezzayer"
nii.format ["de", "fr", "it"], as: :language # => "Talmant, Tafransist, Taṭalyanit"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Kabyle</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>n tufat</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>n tmeddit</td>
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
      <td><code>kab-DZ</code></td>
      <td>Kabyle (Algeria)</td>
      <td><code>kab</code></td>
    </tr>
  </tbody>
</table>

