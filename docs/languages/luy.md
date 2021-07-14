<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Luyia

## Installation

In order to use Luyia with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Luyia
nii = Nii::Context.new "luy" # => #<Nii::Context:luy-KE>

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
      <td>Name in Luyia</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>a.m.</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>p.m.</td>
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
      <td><code>luy-KE</code></td>
      <td>Luyia (Kenya)</td>
      <td><code>luy</code> and <code>bxk</code></td>
    </tr>
  </tbody>
</table>

