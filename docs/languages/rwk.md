<!-- This file has been generated. Source: languages/_template.md.erb -->

# Rwa

## Installation

In order to use Rwa with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Rwa
nii = Nii::Context.new "rwk" # => #<Nii::Context:rwk-TZ>

# Value formatting
nii.format 9.99, style: :currency            # => "9.99 TSh"
nii.format Nii::Territory["TZ"]              # => "Tanzania"
nii.format ["de", "fr", "it"], as: :language # => "Kyijerumani, Kyifaransa, Kyiitaliano"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Rwa</td>
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
      <td><code>rwk-TZ</code></td>
      <td>Rwa (Tanzania)</td>
      <td><code>rwk</code></td>
    </tr>
  </tbody>
</table>

