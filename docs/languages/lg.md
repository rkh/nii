<!-- This file has been generated. Source: languages/_template.md.erb -->

# Ganda

## Installation

In order to use Ganda with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Ganda
nii = Nii::Context.new "lg" # => #<Nii::Context:lg-UG>

# Value formatting
nii.format 9.99, style: :currency            # => "9.99 USh"
nii.format Nii::Territory["UG"]              # => "Yuganda"
nii.format ["de", "fr", "it"], as: :language # => "Ludaaki, Lufalansa, Luyitale"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Ganda</td>
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
      <td><code>lg-UG</code></td>
      <td>Ganda (Uganda)</td>
      <td><code>lg</code> and <code>lug</code></td>
    </tr>
  </tbody>
</table>

