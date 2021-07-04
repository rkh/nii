<!-- This file has been generated. Source: languages/_template.md.erb -->

# Sichuan Yi

## Installation

In order to use Sichuan Yi with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Sichuan Yi
nii = Nii::Context.new "ii" # => #<Nii::Context:ii-CN>

# Value formatting
nii.format 9.99, style: :currency            # => "¥ 9.99"
nii.format Nii::Territory["CN"]              # => "ꍏꇩ"
nii.format ["de", "fr", "it"], as: :language # => "ꄓꇩꉙ, ꃔꇩꉙ, ꑴꄊꆺꉙ"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Sichuan Yi</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>ꎸꄑ</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>ꁯꋒ</td>
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
      <td><code>ii-CN</code></td>
      <td>Sichuan Yi (China)</td>
      <td><code>ii</code> and <code>iii</code></td>
    </tr>
  </tbody>
</table>

