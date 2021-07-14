<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Friulian

## Installation

In order to use Friulian with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Friulian
nii = Nii::Context.new "fur" # => #<Nii::Context:fur-IT>

# Value formatting
nii.format 9.99, style: :currency            # => "€ 9,99"
nii.format Nii::Territory["IT"]              # => "Italie"
nii.format ["de", "fr", "it"], as: :language # => "todesc, francês e talian"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Friulian</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>a.</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>p.</td>
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
      <td><code>fur-IT</code></td>
      <td>Friulian (Italy)</td>
      <td><code>fur</code></td>
    </tr>
  </tbody>
</table>

