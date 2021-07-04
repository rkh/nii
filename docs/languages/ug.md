<!-- This file has been generated. Source: languages/_template.md.erb -->

# Uyghur

## Installation

In order to use Uyghur with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Uyghur
nii = Nii::Context.new "ug" # => #<Nii::Context:ug-CN>

# Value formatting
nii.format 9.99, style: :currency            # => "￥9.99"
nii.format Nii::Territory["CN"]              # => "جۇڭگو"
nii.format ["de", "fr", "it"], as: :language # => "گېرمانچە, فىرانسۇزچە, and ئىتالىيانچە"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Uyghur</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>چ.ب</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>چ.ك</td>
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
      <td><code>ug-CN</code></td>
      <td>Uyghur (China)</td>
      <td><code>ug</code> and <code>uig</code></td>
    </tr>
    <tr>
      <td><code>ug-Cyrl</code></td>
      <td>Uyghur (Cyrillic)</td>
      <td></td>
    </tr>
  </tbody>
</table>

