<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Rundi

## Installation

In order to use Rundi with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Rundi
nii = Nii::Context.new "rn" # => #<Nii::Context:rn-BI>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 FBu"
nii.format Nii::Territory["BI"]              # => "Uburundi"
nii.format ["de", "fr", "it"], as: :language # => "Ikidage, Igifaransa, Igitaliyani"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Rundi</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>Z.MU.</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>Z.MW.</td>
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
      <td><code>rn-BI</code></td>
      <td>Rundi (Burundi)</td>
      <td><code>rn</code> and <code>run</code></td>
    </tr>
  </tbody>
</table>

