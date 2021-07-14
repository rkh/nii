<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Embu

## Installation

In order to use Embu with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Embu
nii = Nii::Context.new "ebu" # => #<Nii::Context:ebu-KE>

# Value formatting
nii.format 9.99, style: :currency            # => "Ksh 9.99"
nii.format Nii::Territory["KE"]              # => "Kenya"
nii.format ["de", "fr", "it"], as: :language # => "Kĩnjeremani, Kĩfaransa, Kĩitaliano"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Embu</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>KI</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>UT</td>
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
      <td><code>ebu-KE</code></td>
      <td>Embu (Kenya)</td>
      <td><code>ebu</code></td>
    </tr>
  </tbody>
</table>

