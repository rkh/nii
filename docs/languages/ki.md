<!-- This file has been generated. Source: languages/_template.md.erb -->

# Kikuyu

## Installation

In order to use Kikuyu with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Kikuyu
nii = Nii::Context.new "ki" # => #<Nii::Context:ki-KE>

# Value formatting
nii.format 9.99, style: :currency            # => "Ksh 9.99"
nii.format Nii::Territory["KE"]              # => "Kenya"
nii.format ["de", "fr", "it"], as: :language # => "Kĩnjeremani, Kĩbaranja, Kĩtaliano"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Kikuyu</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>Kiroko</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>Hwaĩ-inĩ</td>
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
      <td><code>ki-KE</code></td>
      <td>Kikuyu (Kenya)</td>
      <td><code>ki</code> and <code>kik</code></td>
    </tr>
  </tbody>
</table>

