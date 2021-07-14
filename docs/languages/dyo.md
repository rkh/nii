<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Jola-Fonyi

## Installation

In order to use Jola-Fonyi with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Jola-Fonyi
nii = Nii::Context.new "dyo" # => #<Nii::Context:dyo-SN>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 F CFA"
nii.format Nii::Territory["SN"]              # => "Senegal"
nii.format ["de", "fr", "it"], as: :language # => "alman, franse, italien"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Jola-Fonyi</td>
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
      <td><code>dyo-SN</code></td>
      <td>Jola-Fonyi (Senegal)</td>
      <td><code>dyo</code></td>
    </tr>
    <tr>
      <td><code>dyo-Arab</code></td>
      <td>Jola-Fonyi (Arabic)</td>
      <td></td>
    </tr>
  </tbody>
</table>

