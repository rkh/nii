<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Central Kurdish

## Installation

In order to use Central Kurdish with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Central Kurdish
nii = Nii::Context.new "ckb" # => #<Nii::Context:ckb-IQ>

# Value formatting
nii.format 9.99, style: :currency            # => "٩٫٩٩ د.ع.‏"
nii.format Nii::Territory["IQ"]              # => "عێراق"
nii.format ["de", "fr", "it"], as: :language # => "ئەڵمانی, فەرەنسی, ئیتالی"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Central Kurdish</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>ب.ن</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>د.ن</td>
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
      <td><code>ckb-IQ</code></td>
      <td>Central Kurdish (Iraq)</td>
      <td><code>ckb</code></td>
    </tr>
    <tr>
      <td><code>ckb-IR</code></td>
      <td>Central Kurdish (Iran)</td>
      <td></td>
    </tr>
  </tbody>
</table>

