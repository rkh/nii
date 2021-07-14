<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Kalenjin

## Installation

In order to use Kalenjin with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Kalenjin
nii = Nii::Context.new "kln" # => #<Nii::Context:kln-KE>

# Value formatting
nii.format 9.99, style: :currency            # => "Ksh 9.99"
nii.format Nii::Territory["KE"]              # => "Emetab Kenya"
nii.format ["de", "fr", "it"], as: :language # => "kutitab Chermani, kutitab Kifaransa, kutitab Talianek"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Kalenjin</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>krn</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>koosk</td>
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
      <td><code>kln-KE</code></td>
      <td>Kalenjin (Kenya)</td>
      <td><code>kln</code> and <code>spy</code></td>
    </tr>
  </tbody>
</table>

