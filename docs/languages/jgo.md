<!-- This file has been generated. Source: languages/_template.md.erb -->

# Ngomba

## Installation

In order to use Ngomba with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Ngomba
nii = Nii::Context.new "jgo" # => #<Nii::Context:jgo-CM>

# Value formatting
nii.format 9.99, style: :currency            # => "FCFA 9,99"
nii.format Nii::Territory["CM"]              # => "Kamɛlûn"
nii.format ["de", "fr", "it"], as: :language # => "Njáman, ŋ́gɛ Fɛlánci, ḿbɛn ŋ́gɛ it"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Ngomba</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>mbaꞌmbaꞌ</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>ŋka mbɔ́t nji</td>
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
      <td><code>jgo-CM</code></td>
      <td>Ngomba (Cameroon)</td>
      <td><code>jgo</code></td>
    </tr>
  </tbody>
</table>

