<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Gusii

## Installation

In order to use Gusii with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Gusii
nii = Nii::Context.new "guz" # => #<Nii::Context:guz-KE>

# Value formatting
nii.format 9.99, style: :currency            # => "Ksh 9.99"
nii.format Nii::Territory["KE"]              # => "Kenya"
nii.format ["de", "fr", "it"], as: :language # => "Kijerumani, Kifaransa, Kiitaliano"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Gusii</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>Ma</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>Mo</td>
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
      <td><code>guz-KE</code></td>
      <td>Gusii (Kenya)</td>
      <td><code>guz</code></td>
    </tr>
  </tbody>
</table>

