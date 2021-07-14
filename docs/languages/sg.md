<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Sango

## Installation

In order to use Sango with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Sango
nii = Nii::Context.new "sg" # => #<Nii::Context:sg-CF>

# Value formatting
nii.format 9.99, style: :currency            # => "FCFA 9,99"
nii.format Nii::Territory["CF"]              # => "Ködörösêse tî Bêafrîka"
nii.format ["de", "fr", "it"], as: :language # => "Zâmani, Farânzi, Ênnde"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Sango</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>ND</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>LK</td>
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
      <td><code>sg-CF</code></td>
      <td>Sango (Central African Republic)</td>
      <td><code>sg</code> and <code>sag</code></td>
    </tr>
  </tbody>
</table>

