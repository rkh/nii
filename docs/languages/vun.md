<!-- This file has been generated. Source: languages/_template.md.erb -->

# Vunjo

## Installation

In order to use Vunjo with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Vunjo
nii = Nii::Context.new "vun" # => #<Nii::Context:vun-TZ>

# Value formatting
nii.format 9.99, style: :currency            # => "TSh 9.99"
nii.format Nii::Territory["TZ"]              # => "Tanzania"
nii.format ["de", "fr", "it"], as: :language # => "Kyijerumani, Kyifaransa, Kyiitaliano"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Vunjo</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>utuko</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>kyiukonyi</td>
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
      <td><code>vun-TZ</code></td>
      <td>Vunjo (Tanzania)</td>
      <td><code>vun</code></td>
    </tr>
  </tbody>
</table>

