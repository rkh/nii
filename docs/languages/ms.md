<!-- This file has been generated. Source: languages/_template.md.erb -->

# Malay

## Installation

You do not need any additional libraries to use Malay with Nii.
However, you do need to install `nii-extra-locales` in order to use Malay (Arabic).
See the [list of locales](#locales) below.

## Example Usage

``` ruby
# Create a context for Malay
nii = Nii::Context.new "ms" # => #<Nii::Context:ms-MY>

# Value formatting
nii.format 9.99, style: :currency            # => "RM 9.99"
nii.format Nii::Territory["MY"]              # => "Malaysia"
nii.format ["de", "fr", "it"], as: :language # => "Jerman, Perancis dan Itali"

# Spelling out numbers
nii.spellout 115                  # => "seratus lima belas"
nii.spellout 1                    # => "satu"
nii.spellout 2020, rule: :year    # => "dua ribu dua puluh"
nii.spellout 115,  rule: :ordinal # => "keseratus lima belas"

# With RubyMoney
price = Money.eur 15_00
nii.format   price # => "€15.00"
nii.spellout price # => "lima belas Euro"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Malay</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>PG</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>PTG</td>
      <td>12:00 to 24:00</td>
    </tr>
    <tr>
      <td>afternoon1</td>
      <td>afternoon</td>
      <td>tengah hari</td>
      <td>12:00 to 14:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>petang</td>
      <td>14:00 to 19:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>tengah malam</td>
      <td>00:00 to 01:00</td>
    </tr>
    <tr>
      <td>morning2</td>
      <td>morning</td>
      <td>pagi</td>
      <td>01:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>malam</td>
      <td>19:00 to 24:00</td>
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
      <td><code>ms-Arab</code></td>
      <td><code>nii-extra-locales</code></td>
      <td>Malay (Arabic)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ms-BN</code></td>
      <td><code>nii-core</code></td>
      <td>Malay (Brunei)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ms-ID</code></td>
      <td><code>nii-core</code></td>
      <td>Malay (Indonesia)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ms-MY</code></td>
      <td><code>nii-core</code></td>
      <td>Malay (Malaysia)</td>
      <td><code>ms</code>, <code>may</code>, <code>msa</code>, and <code>zsm</code></td>
    </tr>
    <tr>
      <td><code>ms-SG</code></td>
      <td><code>nii-core</code></td>
      <td>Malay (Singapore)</td>
      <td></td>
    </tr>
  </tbody>
</table>

