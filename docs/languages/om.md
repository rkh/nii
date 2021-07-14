<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Oromo

## Installation

In order to use Oromo with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Oromo
nii = Nii::Context.new "om" # => #<Nii::Context:om-ET>

# Value formatting
nii.format 9.99, style: :currency            # => "Br 9.99"
nii.format Nii::Territory["ET"]              # => "Itoophiyaa"
nii.format ["de", "fr", "it"], as: :language # => "Afaan Jarmanii, Afaan Faransaayii, Afaan Xaaliyaani"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Oromo</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>WD</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>WB</td>
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
      <td><code>om-ET</code></td>
      <td>Oromo (Ethiopia)</td>
      <td><code>om</code>, <code>gaz</code>, and <code>orm</code></td>
    </tr>
    <tr>
      <td><code>om-KE</code></td>
      <td>Oromo (Kenya)</td>
      <td></td>
    </tr>
  </tbody>
</table>

