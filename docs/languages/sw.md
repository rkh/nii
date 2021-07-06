<!-- This file has been generated. Source: languages/_template.md.erb -->

# Swahili

## Installation

You do not need any additional libraries to use Swahili with Nii.
However, you do need to install `nii-extra-locales` in order to use Swahili (Arabic).
See the [list of locales](#locales) below.

## Example Usage

``` ruby
# Create a context for Swahili
nii = Nii::Context.new "sw" # => #<Nii::Context:sw-TZ>

# Value formatting
nii.format 9.99, style: :currency            # => "TSh 9.99"
nii.format Nii::Territory["TZ"]              # => "Tanzania"
nii.format ["de", "fr", "it"], as: :language # => "Kijerumani, Kifaransa na Kiitaliano"

# Spelling out numbers
nii.spellout 115                  # => "mia moja na kumi na tano"
nii.spellout 1                    # => "moja"
nii.spellout 2020, rule: :year    # => "elfu mbili, ishirini"
nii.spellout 115,  rule: :ordinal # => "wa mia moja na kumi na tano"

# With RubyMoney
price = Money.eur 15_00
nii.format   price # => "€ 15.00"
nii.spellout price # => "yuro kumi na tano"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Swahili</td>
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
      <td>mchana</td>
      <td>12:00 to 16:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>jioni</td>
      <td>16:00 to 19:00</td>
    </tr>
    <tr>
      <td>midnight</td>
      <td>midnight</td>
      <td>saa sita za usiku</td>
      <td>at 00:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>alfajiri</td>
      <td>04:00 to 07:00</td>
    </tr>
    <tr>
      <td>morning2</td>
      <td>morning</td>
      <td>asubuhi</td>
      <td>07:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>usiku</td>
      <td>19:00 to 04:00</td>
    </tr>
    <tr>
      <td>noon</td>
      <td>noon</td>
      <td>saa sita za mchana</td>
      <td>at 12:00</td>
    </tr>
  </tbody>
</table>



## Locales

<table>
  <thead>
    <tr>
      <th>Locale Tag</th>
      <th>Library</th>
      <th>Description</th>
      <th>Aliases</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>sw-Arab</code></td>
      <td><code>nii-extra-locales</code></td>
      <td>Swahili (Arabic)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>sw-CD</code></td>
      <td><code>nii-core</code></td>
      <td>Congo Swahili</td>
      <td><code>swc</code></td>
    </tr>
    <tr>
      <td><code>sw-KE</code></td>
      <td><code>nii-core</code></td>
      <td>Swahili (Kenya)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>sw-TZ</code></td>
      <td><code>nii-core</code></td>
      <td>Swahili (Tanzania)</td>
      <td><code>sw</code>, <code>swa</code>, and <code>swh</code></td>
    </tr>
    <tr>
      <td><code>sw-UG</code></td>
      <td><code>nii-core</code></td>
      <td>Swahili (Uganda)</td>
      <td></td>
    </tr>
  </tbody>
</table>

