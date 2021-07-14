<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Tajik

## Installation

In order to use Tajik with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Tajik
nii = Nii::Context.new "tg" # => #<Nii::Context:tg-TJ>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 сом."
nii.format Nii::Territory["TJ"]              # => "Тоҷикистон"
nii.format ["de", "fr", "it"], as: :language # => "немисӣ, франсузӣ, италиявӣ"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Tajik</td>
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
      <td><code>tg-TJ</code></td>
      <td>Tajik (Tajikistan)</td>
      <td><code>tg</code> and <code>tgk</code></td>
    </tr>
    <tr>
      <td><code>tg-Arab</code></td>
      <td>Tajik (Arabic)</td>
      <td></td>
    </tr>
  </tbody>
</table>

