<!-- This file has been generated. Source: languages/_template.md.erb -->

# Nigerian Pidgin

## Installation

In order to use Nigerian Pidgin with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Nigerian Pidgin
nii = Nii::Context.new "pcm" # => #<Nii::Context:pcm-NG>

# Value formatting
nii.format 9.99, style: :currency            # => "₦9.99"
nii.format Nii::Territory["NG"]              # => "Naijíria"
nii.format ["de", "fr", "it"], as: :language # => "Jámán Lángwej, Frẹ́nch Lángwej, an Ítáli Lángwej"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Nigerian Pidgin</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>Fọ mọ́nin</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>Fọ ívnin</td>
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
      <td><code>pcm-NG</code></td>
      <td>Nigerian Pidgin (Nigeria)</td>
      <td><code>pcm</code></td>
    </tr>
  </tbody>
</table>

