<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Ossetic

## Installation

In order to use Ossetic with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Ossetic
nii = Nii::Context.new "os" # => #<Nii::Context:os-GE>

# Value formatting
nii.format 9.99, style: :currency            # => "₾ 9,99"
nii.format Nii::Territory["GE"]              # => "Гуырдзыстон"
nii.format ["de", "fr", "it"], as: :language # => "немыцаг, францаг ӕмӕ италиаг"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Ossetic</td>
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
      <td><code>os-GE</code></td>
      <td>Ossetic (Georgia)</td>
      <td><code>os</code> and <code>oss</code></td>
    </tr>
    <tr>
      <td><code>os-RU</code></td>
      <td>Ossetic (Russia)</td>
      <td></td>
    </tr>
  </tbody>
</table>

