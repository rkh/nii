<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Makonde

## Installation

In order to use Makonde with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Makonde
nii = Nii::Context.new "kde" # => #<Nii::Context:kde-TZ>

# Value formatting
nii.format 9.99, style: :currency            # => "TSh 9.99"
nii.format Nii::Territory["TZ"]              # => "Tanzania"
nii.format ["de", "fr", "it"], as: :language # => "Chidyelumani, Chifalansa, Chiitaliano"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Makonde</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>Muhi</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>Chilo</td>
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
      <td><code>kde-TZ</code></td>
      <td>Makonde (Tanzania)</td>
      <td><code>kde</code></td>
    </tr>
  </tbody>
</table>

