<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Mazanderani

## Installation

In order to use Mazanderani with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Mazanderani
nii = Nii::Context.new "mzn" # => #<Nii::Context:mzn-IR>

# Value formatting
nii.format 9.99, style: :currency            # => "IRR ۹٫۹۹"
nii.format Nii::Territory["IR"]              # => "ایران"
nii.format ["de", "fr", "it"], as: :language # => "آلمانی, فرانسوی, ایتالیایی"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Mazanderani</td>
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
      <td><code>mzn-IR</code></td>
      <td>Mazanderani (Iran)</td>
      <td><code>mzn</code></td>
    </tr>
  </tbody>
</table>

