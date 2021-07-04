<!-- This file has been generated. Source: languages/_template.md.erb -->

# Luba-Katanga

## Installation

In order to use Luba-Katanga with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Luba-Katanga
nii = Nii::Context.new "lu" # => #<Nii::Context:lu-CD>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 FC"
nii.format Nii::Territory["CD"]              # => "Ditunga wa Kongu"
nii.format ["de", "fr", "it"], as: :language # => "Lizelumani, Mfwàlànsa, Litali"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Luba-Katanga</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>Dinda</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>Dilolo</td>
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
      <td><code>lu-CD</code></td>
      <td>Luba-Katanga (Congo - Kinshasa)</td>
      <td><code>lu</code> and <code>lub</code></td>
    </tr>
  </tbody>
</table>

