<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Zulu

## Installation

You do not need any additional libraries to use Zulu with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Zulu
nii = Nii::Context.new "zu" # => #<Nii::Context:zu-ZA>

# Value formatting
nii.format 9.99, style: :currency            # => "R 9.99"
nii.format Nii::Territory["ZA"]              # => "iNingizimu Afrika"
nii.format ["de", "fr", "it"], as: :language # => "isi-German, isi-French, ne-isi-Italian"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Zulu</td>
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
    <tr>
      <td>afternoon1</td>
      <td>afternoon</td>
      <td>emini</td>
      <td>10:00 to 13:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>ntambama</td>
      <td>13:00 to 19:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>entathakusa</td>
      <td>00:00 to 06:00</td>
    </tr>
    <tr>
      <td>morning2</td>
      <td>morning</td>
      <td>ekuseni</td>
      <td>06:00 to 10:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>ebusuku</td>
      <td>19:00 to 24:00</td>
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
      <td><code>zu-ZA</code></td>
      <td>Zulu (South Africa)</td>
      <td><code>zu</code> and <code>zul</code></td>
    </tr>
  </tbody>
</table>

