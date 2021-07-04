<!-- This file has been generated. Source: languages/_template.md.erb -->

# Chechen

## Installation

In order to use Chechen with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Chechen
nii = Nii::Context.new "ce" # => #<Nii::Context:ce-RU>

# Value formatting
nii.format 9.99, style: :currency            # => "9.99 ₽"
nii.format Nii::Territory["RU"]              # => "Росси"
nii.format ["de", "fr", "it"], as: :language # => "немцойн, французийн, итальянийн"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Chechen</td>
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
      <td><code>ce-RU</code></td>
      <td>Chechen (Russia)</td>
      <td><code>ce</code> and <code>che</code></td>
    </tr>
  </tbody>
</table>

