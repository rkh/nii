<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Soga

## Installation

In order to use Soga with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Soga
nii = Nii::Context.new "xog" # => #<Nii::Context:xog-UG>

# Value formatting
nii.format 9.99, style: :currency            # => "9.99 USh"
nii.format Nii::Territory["UG"]              # => "Yuganda"
nii.format ["de", "fr", "it"], as: :language # => "Oludaaki, Olufalansa, Oluyitale"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Soga</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>Munkyo</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>Eigulo</td>
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
      <td><code>xog-UG</code></td>
      <td>Soga (Uganda)</td>
      <td><code>xog</code></td>
    </tr>
  </tbody>
</table>

