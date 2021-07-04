<!-- This file has been generated. Source: languages/_template.md.erb -->

# Langi

## Installation

In order to use Langi with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Langi
nii = Nii::Context.new "lag" # => #<Nii::Context:lag-TZ>

# Value formatting
nii.format 9.99, style: :currency            # => "TSh 9.99"
nii.format Nii::Territory["TZ"]              # => "Taansanía"
nii.format ["de", "fr", "it"], as: :language # => "Kɨjerʉmáani, Kɨfaráansa, Kɨtaliáano"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Langi</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>TOO</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>MUU</td>
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
      <td><code>lag-TZ</code></td>
      <td>Langi (Tanzania)</td>
      <td><code>lag</code></td>
    </tr>
  </tbody>
</table>

