<!-- This file has been generated. Source: languages/_template.md.erb -->

# Shambala

## Installation

In order to use Shambala with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Shambala
nii = Nii::Context.new "ksb" # => #<Nii::Context:ksb-TZ>

# Value formatting
nii.format 9.99, style: :currency            # => "9.99 TSh"
nii.format Nii::Territory["TZ"]              # => "Tanzania"
nii.format ["de", "fr", "it"], as: :language # => "Kijeumani, Kifalansa, Kiitaliano"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Shambala</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>makeo</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>nyiaghuo</td>
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
      <td><code>ksb-TZ</code></td>
      <td>Shambala (Tanzania)</td>
      <td><code>ksb</code></td>
    </tr>
  </tbody>
</table>

