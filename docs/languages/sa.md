<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Sanskrit

## Installation

In order to use Sanskrit with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Sanskrit
nii = Nii::Context.new "sa" # => #<Nii::Context:sa-IN>

# Value formatting
nii.format 9.99, style: :currency            # => "₹९.९९"
nii.format Nii::Territory["IN"]              # => "भारतः"
nii.format ["de", "fr", "it"], as: :language # => "जर्मनभाषा:, फ़्रांसदेशीय भाषा:, तथा इटलीदेशीय भाषा:"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Sanskrit</td>
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


## Variants

<table>
  <thead>
    <tr>
      <th>Subtag</th>
      <th>Description</th>
      <th>Comments</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>bauddha</code></td>
      <td>Buddhist Hybrid Sanskrit</td>
      <td></td>
    </tr>
    <tr>
      <td><code>itihasa</code></td>
      <td>Epic Sanskrit</td>
      <td></td>
    </tr>
    <tr>
      <td><code>laukika</code></td>
      <td>Classical Sanskrit</td>
      <td></td>
    </tr>
    <tr>
      <td><code>vaidika</code></td>
      <td>Vedic Sanskrit</td>
      <td>The most ancient dialect of Sanskrit used in verse and prose composed until about the 4th century B.C.E.</td>
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
      <td><code>sa-IN</code></td>
      <td>Sanskrit (India)</td>
      <td><code>sa</code> and <code>san</code></td>
    </tr>
  </tbody>
</table>

