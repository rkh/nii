<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Bosnian

## Installation

You do not need any additional libraries to use Bosnian with Nii.
However, you do need to install `nii-extra-locales` in order to use Bosnian (Cyrillic).
See the [list of locales](#locales) below.

## Example Usage

``` ruby
# Create a context for Bosnian
nii = Nii::Context.new "bs" # => #<Nii::Context:bs-Latn-BA>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 KM"
nii.format Nii::Territory["BA"]              # => "Bosna i Hercegovina"
nii.format ["de", "fr", "it"], as: :language # => "njemački, francuski i italijanski"

# Spelling out numbers
nii.spellout 115                   # => "sto petnaest"
nii.spellout 1                     # => "jedan"
nii.spellout 2020, rule: :year     # => "dve hiljada dvadeset"
nii.spellout 1,    rule: :neuter   # => "jedno"
nii.spellout 1,    rule: :feminine # => "jedinica"

# With RubyMoney
price = Money.eur 15_00
nii.format   price # => "15,00 €"
nii.spellout price # => "petnaest eura"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Bosnian</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>prijepodne</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>popodne</td>
      <td>12:00 to 24:00</td>
    </tr>
    <tr>
      <td>afternoon1</td>
      <td>afternoon</td>
      <td>poslijepodne</td>
      <td>12:00 to 18:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>navečer</td>
      <td>18:00 to 21:00</td>
    </tr>
    <tr>
      <td>midnight</td>
      <td>midnight</td>
      <td>ponoć</td>
      <td>at 00:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>ujutro</td>
      <td>04:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>po noći</td>
      <td>21:00 to 04:00</td>
    </tr>
    <tr>
      <td>noon</td>
      <td>noon</td>
      <td>podne</td>
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
      <td><code>bs-Cyrl</code></td>
      <td><code>nii-extra-locales</code></td>
      <td>Bosnian (Cyrillic)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>bs-Cyrl-BA</code></td>
      <td><code>nii-core</code></td>
      <td>Bosnian (Cyrillic, Bosnia &amp; Herzegovina)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>bs-Latn</code></td>
      <td><code>nii-core</code></td>
      <td>Bosnian (Latin)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>bs-Latn-BA</code></td>
      <td><code>nii-core</code></td>
      <td>Bosnian (Latin, Bosnia &amp; Herzegovina)</td>
      <td><code>bs</code> and <code>bos</code></td>
    </tr>
  </tbody>
</table>

