<!-- This file has been generated. Source: languages/_template.md.erb -->

# Colognian

## Installation

In order to use Colognian with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Colognian
nii = Nii::Context.new "ksh" # => #<Nii::Context:ksh-DE>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 €"
nii.format Nii::Territory["DE"]              # => "Doütschland"
nii.format ["de", "fr", "it"], as: :language # => "Deutsch, Franzühsesch un Etalljähnesch"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Colognian</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>Vörmeddaach</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>Nommendaach</td>
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
      <td><code>ksh-DE</code></td>
      <td>Colognian (Germany)</td>
      <td><code>ksh</code></td>
    </tr>
  </tbody>
</table>

