<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Morisyen

## Installation

In order to use Morisyen with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Morisyen
nii = Nii::Context.new "mfe" # => #<Nii::Context:mfe-MU>

# Value formatting
nii.format 9.99, style: :currency            # => "Rs 9.99"
nii.format Nii::Territory["MU"]              # => "Moris"
nii.format ["de", "fr", "it"], as: :language # => "alman, franse, italien"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Morisyen</td>
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
      <td><code>mfe-MU</code></td>
      <td>Morisyen (Mauritius)</td>
      <td><code>mfe</code></td>
    </tr>
  </tbody>
</table>

