<!-- This file has been generated. Source: languages/_template.md.erb -->

# Indonesian

## Installation

You do not need any additional libraries to use Indonesian with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Indonesian
nii = Nii::Context.new "id" # => #<Nii::Context:id-ID>

# Value formatting
nii.format 9.99, style: :currency            # => "Rp 9,99"
nii.format Nii::Territory["ID"]              # => "Indonesia"
nii.format ["de", "fr", "it"], as: :language # => "Jerman, Prancis, dan Italia"

# Spelling out numbers
nii.numbers.spellout 115            # => "seratus lima belas"
nii.numbers.spellout 1              # => "satu"
nii.numbers.spellout 2020, :year    # => "dua ribu dua puluh"
nii.numbers.spellout 115,  :ordinal # => "keseratus lima belas"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Indonesian</td>
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
    <tr>
      <td>afternoon1</td>
      <td>afternoon</td>
      <td>siang</td>
      <td>10:00 to 15:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>sore</td>
      <td>15:00 to 18:00</td>
    </tr>
    <tr>
      <td>midnight</td>
      <td>midnight</td>
      <td>tengah malam</td>
      <td>at 00:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>pagi</td>
      <td>00:00 to 10:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>malam</td>
      <td>18:00 to 24:00</td>
    </tr>
    <tr>
      <td>noon</td>
      <td>noon</td>
      <td>tengah hari</td>
      <td>at 12:00</td>
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
      <td><code>id-ID</code></td>
      <td>Indonesian (Indonesia)</td>
      <td><code>id</code>, <code>in</code>, and <code>ind</code></td>
    </tr>
  </tbody>
</table>

