<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Javanese

## Installation

You do not need any additional libraries to use Javanese with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Javanese
nii = Nii::Context.new "jv" # => #<Nii::Context:jv-ID>

# Value formatting
nii.format 9.99, style: :currency            # => "Rp 9,99"
nii.format Nii::Territory["ID"]              # => "Indonésia"
nii.format ["de", "fr", "it"], as: :language # => "Jérman, Prancis, lan Italia"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Javanese</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>Isuk</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>Wengi</td>
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
      <td><code>jv-ID</code></td>
      <td>Javanese (Indonesia)</td>
      <td><code>jv</code>, <code>jav</code>, and <code>jw</code></td>
    </tr>
  </tbody>
</table>

