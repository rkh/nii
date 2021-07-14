<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Asu

## Installation

In order to use Asu with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Asu
nii = Nii::Context.new "asa" # => #<Nii::Context:asa-TZ>

# Value formatting
nii.format 9.99, style: :currency            # => "9.99 TSh"
nii.format Nii::Territory["TZ"]              # => "Tadhania"
nii.format ["de", "fr", "it"], as: :language # => "Kijerumani, Kifarantha, Kiitaliaano"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Asu</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>icheheavo</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>ichamthi</td>
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
      <td><code>asa-TZ</code></td>
      <td>Asu (Tanzania)</td>
      <td><code>asa</code></td>
    </tr>
  </tbody>
</table>

