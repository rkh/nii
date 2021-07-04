<!-- This file has been generated. Source: languages/_template.md.erb -->

# Western Frisian

## Installation

In order to use Western Frisian with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Western Frisian
nii = Nii::Context.new "fy" # => #<Nii::Context:fy-NL>

# Value formatting
nii.format 9.99, style: :currency            # => "€ 9,99"
nii.format Nii::Territory["NL"]              # => "Nederlân"
nii.format ["de", "fr", "it"], as: :language # => "Dútsk, Frânsk en Italiaansk"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Western Frisian</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>AM</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>PM</td>
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
      <td><code>fy-NL</code></td>
      <td>Western Frisian (Netherlands)</td>
      <td><code>fy</code> and <code>fry</code></td>
    </tr>
  </tbody>
</table>

