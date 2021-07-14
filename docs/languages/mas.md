<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Masai

## Installation

In order to use Masai with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Masai
nii = Nii::Context.new "mas" # => #<Nii::Context:mas-KE>

# Value formatting
nii.format 9.99, style: :currency            # => "Ksh 9.99"
nii.format Nii::Territory["KE"]              # => "Kenya"
nii.format ["de", "fr", "it"], as: :language # => "nkʉtʉ́k ɔ́ɔ̄ ljerumani, nkʉtʉ́k ɔ́ɔ̄ faransa, nkʉtʉ́k ɔ́ɔ̄ ltalian"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Masai</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>Ɛnkakɛnyá</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>Ɛndámâ</td>
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
      <td><code>mas-KE</code></td>
      <td>Masai (Kenya)</td>
      <td><code>mas</code></td>
    </tr>
    <tr>
      <td><code>mas-TZ</code></td>
      <td>Masai (Tanzania)</td>
      <td></td>
    </tr>
  </tbody>
</table>

