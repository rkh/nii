<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Makhuwa-Meetto

## Installation

In order to use Makhuwa-Meetto with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Makhuwa-Meetto
nii = Nii::Context.new "mgh" # => #<Nii::Context:mgh-MZ>

# Value formatting
nii.format 9.99, style: :currency            # => "MTn 9,99"
nii.format Nii::Territory["MZ"]              # => "Umozambiki"
nii.format ["de", "fr", "it"], as: :language # => "Ijerimani, Ifaransa, Italiano"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Makhuwa-Meetto</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>wichishu</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>mchochil’l</td>
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
      <td><code>mgh-MZ</code></td>
      <td>Makhuwa-Meetto (Mozambique)</td>
      <td><code>mgh</code></td>
    </tr>
  </tbody>
</table>

