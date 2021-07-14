<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Nama

## Installation

In order to use Nama with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Nama
nii = Nii::Context.new "naq" # => #<Nii::Context:naq-NA>

# Value formatting
nii.format 9.99, style: :currency            # => "ZAR 9.99"
nii.format Nii::Territory["NA"]              # => "Namibiab"
nii.format ["de", "fr", "it"], as: :language # => "Duits, Frans, Italians"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Nama</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>ǁgoagas</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>ǃuias</td>
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
      <td><code>naq-NA</code></td>
      <td>Nama (Namibia)</td>
      <td><code>naq</code></td>
    </tr>
  </tbody>
</table>

