<!-- This file has been generated. Source: languages/_template.md.erb -->

# Volapük

## Installation

In order to use Volapük with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Volapük
nii = Nii::Context.new "vo" # => #<Nii::Context:vo-001>

# Value formatting
nii.format 9.99, currency: "USD"             # => "US$ 9.99"
nii.format Nii::Territory["001"]             # => "001"
nii.format ["de", "fr", "it"], as: :language # => "de, fr, it"
```

## Variants

<table>
  <thead>
    <tr>
      <th>Subtag</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>nulik</code></td>
      <td>Volapük nulik / Volapük perevidöl / Volapük nulädik / de Jong's Volapük / New Volapük / Revised Volapük / Modern Volapük</td>
    </tr>
    <tr>
      <td><code>rigik</code></td>
      <td>Volapük rigik / Schleyer's Volapük / Original Volapük / Classic Volapük</td>
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
      <td><code>vo</code></td>
      <td>Volapük</td>
      <td><code>vol</code></td>
    </tr>
  </tbody>
</table>

