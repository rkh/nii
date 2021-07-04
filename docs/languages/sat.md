<!-- This file has been generated. Source: languages/_template.md.erb -->

# Santali

## Installation

In order to use Santali with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Santali
nii = Nii::Context.new "sat" # => #<Nii::Context:sat-Olck-IN>

# Value formatting
nii.format 9.99, style: :currency            # => "₹ ᱙.᱙᱙"
nii.format Nii::Territory["IN"]              # => "ᱤᱱᱰᱤᱭᱟ"
nii.format ["de", "fr", "it"], as: :language # => "ᱡᱟᱨᱢᱟᱱ, ᱯᱷᱨᱮᱧᱪ, ᱤᱴᱟᱞᱤᱟᱱ"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Santali</td>
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
      <td><code>sat-Deva</code></td>
      <td>Santali (Devanagari)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>sat-Olck</code></td>
      <td>Santali (Ol Chiki)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>sat-Olck-IN</code></td>
      <td>Santali (Ol Chiki, India)</td>
      <td><code>sat</code></td>
    </tr>
  </tbody>
</table>

