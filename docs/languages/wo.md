<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Wolof

## Installation

In order to use Wolof with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Wolof
nii = Nii::Context.new "wo" # => #<Nii::Context:wo-SN>

# Value formatting
nii.format 9.99, style: :currency            # => "F CFA 9,99"
nii.format Nii::Territory["SN"]              # => "Senegaal"
nii.format ["de", "fr", "it"], as: :language # => "Almaa, Farañse, Italiye"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Wolof</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>Sub</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>Ngo</td>
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
      <td><code>wo-SN</code></td>
      <td>Wolof (Senegal)</td>
      <td><code>wo</code> and <code>wol</code></td>
    </tr>
    <tr>
      <td><code>wo-Arab</code></td>
      <td>Wolof (Arabic)</td>
      <td></td>
    </tr>
  </tbody>
</table>

