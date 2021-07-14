<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Low German

## Installation

In order to use Low German with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Low German
nii = Nii::Context.new "nds" # => #<Nii::Context:nds-DE>

# Value formatting
nii.format 9.99, style: :currency            # => "€ 9.99"
nii.format Nii::Territory["DE"]              # => "DE"
nii.format ["de", "fr", "it"], as: :language # => "de, fr, it"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Low German</td>
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
      <td><code>nds-DE</code></td>
      <td>Low German (Germany)</td>
      <td><code>nds</code></td>
    </tr>
    <tr>
      <td><code>nds-NL</code></td>
      <td>Low Saxon</td>
      <td></td>
    </tr>
  </tbody>
</table>

