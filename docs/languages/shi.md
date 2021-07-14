<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Tachelhit

## Installation

In order to use Tachelhit with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Tachelhit
nii = Nii::Context.new "shi" # => #<Nii::Context:shi-Tfng-MA>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 MAD"
nii.format Nii::Territory["MA"]              # => "ⵍⵎⵖⵔⵉⴱ"
nii.format ["de", "fr", "it"], as: :language # => "ⵜⴰⵍⵉⵎⴰⵏⵜ, ⵜⴰⴼⵔⴰⵏⵙⵉⵙⵜ, ⵜⴰⵟⴰⵍⵢⴰⵏⵜ"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Tachelhit</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>ⵜⵉⴼⴰⵡⵜ</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>ⵜⴰⴷⴳⴳⵯⴰⵜ</td>
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
      <td><code>shi-Latn</code></td>
      <td>Tachelhit (Latin)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>shi-Latn-MA</code></td>
      <td>Tachelhit (Latin, Morocco)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>shi-Tfng</code></td>
      <td>Tachelhit (Tifinagh)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>shi-Tfng-MA</code></td>
      <td>Tachelhit (Tifinagh, Morocco)</td>
      <td><code>shi</code></td>
    </tr>
  </tbody>
</table>

