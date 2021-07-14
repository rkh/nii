<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Ewondo

## Installation

In order to use Ewondo with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Ewondo
nii = Nii::Context.new "ewo" # => #<Nii::Context:ewo-CM>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 FCFA"
nii.format Nii::Territory["CM"]              # => "Kamərún"
nii.format ["de", "fr", "it"], as: :language # => "Ǹkɔ́bɔ ndzáman, Ǹkɔ́bɔ fulɛnsí, Ǹkɔ́bɔ etáliɛn"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Ewondo</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>kíkíríg</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>ngəgógəle</td>
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
      <td><code>ewo-CM</code></td>
      <td>Ewondo (Cameroon)</td>
      <td><code>ewo</code></td>
    </tr>
  </tbody>
</table>

