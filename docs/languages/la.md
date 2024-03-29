<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Latin

## Installation

In order to use Latin with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Latin
nii = Nii::Context.new "la" # => #<Nii::Context:la-001>

# Value formatting
nii.format 9.99, currency: "USD"             # => "US$ 9.99"
nii.format Nii::Territory["001"]             # => "001"
nii.format ["de", "fr", "it"], as: :language # => "de, fr, it"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Latin</td>
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


## Variants

<table>
  <thead>
    <tr>
      <th>Subtag</th>
      <th>Description</th>
      <th>Comments</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>peano</code></td>
      <td>Latino Sine Flexione / Interlingua de API / Interlingua de Peano</td>
      <td>Peano’s Interlingua, created in 1903 by Giuseppe Peano as an international auxiliary language</td>
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
      <td><code>la</code></td>
      <td>Latin</td>
      <td><code>lat</code></td>
    </tr>
  </tbody>
</table>

