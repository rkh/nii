<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Nuer

## Installation

In order to use Nuer with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Nuer
nii = Nii::Context.new "nus" # => #<Nii::Context:nus-SS>

# Value formatting
nii.format 9.99, style: :currency            # => "£9.99"
nii.format Nii::Territory["SS"]              # => "SS"
nii.format ["de", "fr", "it"], as: :language # => "Thok jarmani, Thok pɔrɔthani, Thok i̱taliani"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Nuer</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>RW</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>TŊ</td>
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
      <td><code>nus-SS</code></td>
      <td>Nuer (South Sudan)</td>
      <td><code>nus</code></td>
    </tr>
  </tbody>
</table>

