<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Samburu

## Installation

In order to use Samburu with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Samburu
nii = Nii::Context.new "saq" # => #<Nii::Context:saq-KE>

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
      <td>Name in Samburu</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>Tesiran</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>Teipa</td>
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
      <td><code>saq-KE</code></td>
      <td>Samburu (Kenya)</td>
      <td><code>saq</code></td>
    </tr>
  </tbody>
</table>

