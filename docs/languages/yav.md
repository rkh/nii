<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Yangben

## Installation

In order to use Yangben with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Yangben
nii = Nii::Context.new "yav" # => #<Nii::Context:yav-CM>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 FCFA"
nii.format Nii::Territory["CM"]              # => "Kemelún"
nii.format ["de", "fr", "it"], as: :language # => "ŋndiáman, feleŋsí, itáliɛ"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Yangben</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>kiɛmɛ́ɛm</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>kisɛ́ndɛ</td>
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
      <td><code>yav-CM</code></td>
      <td>Yangben (Cameroon)</td>
      <td><code>yav</code></td>
    </tr>
  </tbody>
</table>

