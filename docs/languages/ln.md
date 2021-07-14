<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Lingala

## Installation

In order to use Lingala with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Lingala
nii = Nii::Context.new "ln" # => #<Nii::Context:ln-CD>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 FC"
nii.format Nii::Territory["CD"]              # => "Republíki ya Kongó Demokratíki"
nii.format ["de", "fr", "it"], as: :language # => "lialemá, lifalansɛ́, litaliano"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Lingala</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>ntɔ́ngɔ́</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>mpókwa</td>
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
      <td><code>ln-AO</code></td>
      <td>Lingala (Angola)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ln-CD</code></td>
      <td>Lingala (Congo - Kinshasa)</td>
      <td><code>ln</code> and <code>lin</code></td>
    </tr>
    <tr>
      <td><code>ln-CF</code></td>
      <td>Lingala (Central African Republic)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ln-CG</code></td>
      <td>Lingala (Congo - Brazzaville)</td>
      <td></td>
    </tr>
  </tbody>
</table>

