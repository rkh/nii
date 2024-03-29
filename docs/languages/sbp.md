<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Sangu

## Installation

In order to use Sangu with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Sangu
nii = Nii::Context.new "sbp" # => #<Nii::Context:sbp-TZ>

# Value formatting
nii.format 9.99, style: :currency            # => "9.99 TSh"
nii.format Nii::Territory["TZ"]              # => "Tansaniya"
nii.format ["de", "fr", "it"], as: :language # => "Ishijelumani, Ishifalansa, Ishihitaliyano"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Sangu</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>Lwamilawu</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>Pashamihe</td>
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
      <td><code>sbp-TZ</code></td>
      <td>Sangu (Tanzania)</td>
      <td><code>sbp</code></td>
    </tr>
  </tbody>
</table>

