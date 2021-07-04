<!-- This file has been generated. Source: languages/_template.md.erb -->

# Scottish Gaelic

## Installation

In order to use Scottish Gaelic with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Scottish Gaelic
nii = Nii::Context.new "gd" # => #<Nii::Context:gd-GB>

# Value formatting
nii.format 9.99, style: :currency            # => "£9.99"
nii.format Nii::Territory["GB"]              # => "An Rìoghachd Aonaichte"
nii.format ["de", "fr", "it"], as: :language # => "Gearmailtis, Fraingis agus Eadailtis"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Scottish Gaelic</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>m</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>f</td>
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
      <td><code>gd-GB</code></td>
      <td>Scottish Gaelic (United Kingdom)</td>
      <td><code>gd</code> and <code>gla</code></td>
    </tr>
  </tbody>
</table>

