<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Central Atlas Tamazight

## Installation

In order to use Central Atlas Tamazight with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Central Atlas Tamazight
nii = Nii::Context.new "tzm" # => #<Nii::Context:tzm-MA>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 MAD"
nii.format Nii::Territory["MA"]              # => "Meṛṛuk"
nii.format ["de", "fr", "it"], as: :language # => "Talmanit, Tafṛansist, Taṭalyant"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Central Atlas Tamazight</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>Zdat azal</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>Ḍeffir aza</td>
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
      <td><code>tzm-MA</code></td>
      <td>Central Atlas Tamazight (Morocco)</td>
      <td><code>tzm</code></td>
    </tr>
  </tbody>
</table>

