<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Dogri

## Installation

In order to use Dogri with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Dogri
nii = Nii::Context.new "doi" # => #<Nii::Context:doi-IN>

# Value formatting
nii.format 9.99, style: :currency            # => "₹9.99"
nii.format Nii::Territory["IN"]              # => "भारत"
nii.format ["de", "fr", "it"], as: :language # => "जर्मन, फ्रेंच, ते इटालियन"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Dogri</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>सवेर</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>स’ञ</td>
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
      <td><code>doi-IN</code></td>
      <td>Dogri (India)</td>
      <td><code>doi</code> and <code>dgo</code></td>
    </tr>
  </tbody>
</table>

