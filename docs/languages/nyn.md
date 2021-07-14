<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Nyankole

## Installation

In order to use Nyankole with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Nyankole
nii = Nii::Context.new "nyn" # => #<Nii::Context:nyn-UG>

# Value formatting
nii.format 9.99, style: :currency            # => "USh 9.99"
nii.format Nii::Territory["UG"]              # => "Uganda"
nii.format ["de", "fr", "it"], as: :language # => "Orugirimaani, Orufaransa, Oruyitare"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Nyankole</td>
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
      <td><code>nyn-UG</code></td>
      <td>Nyankole (Uganda)</td>
      <td><code>nyn</code></td>
    </tr>
  </tbody>
</table>

