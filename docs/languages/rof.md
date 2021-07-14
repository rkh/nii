<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Rombo

## Installation

In order to use Rombo with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Rombo
nii = Nii::Context.new "rof" # => #<Nii::Context:rof-TZ>

# Value formatting
nii.format 9.99, style: :currency            # => "TSh 9.99"
nii.format Nii::Territory["TZ"]              # => "Tanzania"
nii.format ["de", "fr", "it"], as: :language # => "Kijerumani, Kyifaransa, Kiitaliano"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Rombo</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>kang’ama</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>kingoto</td>
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
      <td><code>rof-TZ</code></td>
      <td>Rombo (Tanzania)</td>
      <td><code>rof</code></td>
    </tr>
  </tbody>
</table>

