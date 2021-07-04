<!-- This file has been generated. Source: languages/_template.md.erb -->

# Basque

## Installation

You do not need any additional libraries to use Basque with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Basque
nii = Nii::Context.new "eu" # => #<Nii::Context:eu-ES>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 €"
nii.format Nii::Territory["ES"]              # => "Espainia"
nii.format ["de", "fr", "it"], as: :language # => "aleman, frantses eta italiera"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Basque</td>
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
      <td>eguerdia</td>
      <td>12:00 to 14:00</td>
    </tr>
    <tr>
      <td>afternoon2</td>
      <td>afternoon</td>
      <td>arratsaldea</td>
      <td>14:00 to 19:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>iluntzea</td>
      <td>19:00 to 21:00</td>
    </tr>
    <tr>
      <td>midnight</td>
      <td>midnight</td>
      <td>gauerdia</td>
      <td>at 00:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>goizaldea</td>
      <td>00:00 to 06:00</td>
    </tr>
    <tr>
      <td>morning2</td>
      <td>morning</td>
      <td>goiza</td>
      <td>06:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>gaua</td>
      <td>21:00 to 24:00</td>
    </tr>
  </tbody>
</table>


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
      <td><code>biscayan</code></td>
      <td>Biscayan dialect of Basque</td>
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
      <td><code>eu-ES</code></td>
      <td>Basque (Spain)</td>
      <td><code>eu</code>, <code>baq</code>, and <code>eus</code></td>
    </tr>
  </tbody>
</table>

