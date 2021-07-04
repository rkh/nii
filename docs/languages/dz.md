<!-- This file has been generated. Source: languages/_template.md.erb -->

# Dzongkha

## Installation

In order to use Dzongkha with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Dzongkha
nii = Nii::Context.new "dz" # => #<Nii::Context:dz-BT>

# Value formatting
nii.format 9.99, style: :currency            # => "₹༩.༩༩"
nii.format Nii::Territory["BT"]              # => "འབྲུག"
nii.format ["de", "fr", "it"], as: :language # => "ཇཱར་མཱན་ཁ དང་ ཕྲནཅ་ཁ དང་ ཨི་ཊ་ལི་ཡཱན་ཁ"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Dzongkha</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>སྔ་ཆ་</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>ཕྱི་ཆ་</td>
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
      <td><code>dz-BT</code></td>
      <td>Dzongkha (Bhutan)</td>
      <td><code>dz</code>, <code>adp</code>, and <code>dzo</code></td>
    </tr>
  </tbody>
</table>

