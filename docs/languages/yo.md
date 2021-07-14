<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Yoruba

## Installation

In order to use Yoruba with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Yoruba
nii = Nii::Context.new "yo" # => #<Nii::Context:yo-NG>

# Value formatting
nii.format 9.99, style: :currency            # => "₦9.99"
nii.format Nii::Territory["NG"]              # => "Nàìjíríà"
nii.format ["de", "fr", "it"], as: :language # => "Èdè Jámánì, Èdè Faransé, Èdè Ítálì"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Yoruba</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>Àárọ̀</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>Ọ̀sán</td>
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
      <td><code>yo-BJ</code></td>
      <td>Yoruba (Benin)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>yo-NG</code></td>
      <td>Yoruba (Nigeria)</td>
      <td><code>yo</code> and <code>yor</code></td>
    </tr>
    <tr>
      <td><code>yo-Arab</code></td>
      <td>Yoruba (Arabic)</td>
      <td></td>
    </tr>
  </tbody>
</table>

