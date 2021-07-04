<!-- This file has been generated. Source: languages/_template.md.erb -->

# Hawaiian

## Installation

In order to use Hawaiian with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Hawaiian
nii = Nii::Context.new "haw" # => #<Nii::Context:haw-US>

# Value formatting
nii.format 9.99, style: :currency            # => "$9.99"
nii.format Nii::Territory["US"]              # => "ʻAmelika Hui Pū ʻIa"
nii.format ["de", "fr", "it"], as: :language # => "Kelemānia, Palani, ʻĪkālia"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Hawaiian</td>
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
      <td><code>haw-US</code></td>
      <td>Hawaiian (United States)</td>
      <td><code>haw</code></td>
    </tr>
  </tbody>
</table>

