<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Lakota

## Installation

In order to use Lakota with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Lakota
nii = Nii::Context.new "lkt" # => #<Nii::Context:lkt-US>

# Value formatting
nii.format 9.99, style: :currency            # => "$ 9.99"
nii.format Nii::Territory["US"]              # => "Mílahaŋska Tȟamákȟočhe"
nii.format ["de", "fr", "it"], as: :language # => "Iyášiča Iyápi, Wašíču Ikčéka Iyápi, Italia Iyápi"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Lakota</td>
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
      <td><code>lkt-US</code></td>
      <td>Lakota (United States)</td>
      <td><code>lkt</code></td>
    </tr>
  </tbody>
</table>

