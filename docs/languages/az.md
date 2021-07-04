<!-- This file has been generated. Source: languages/_template.md.erb -->

# Azerbaijani

## Installation

You do not need any additional libraries to use Azerbaijani with Nii.
However, you do need to install `nii-extra-locales` in order to use Azerbaijani (Arabic) or Azerbaijani (Cyrillic).
See the [list of locales](#locales) below.

## Example Usage

``` ruby
# Create a context for Azerbaijani
nii = Nii::Context.new "az" # => #<Nii::Context:az-Latn-AZ>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 ₼"
nii.format Nii::Territory["AZ"]              # => "Azərbaycan"
nii.format ["de", "fr", "it"], as: :language # => "alman, fransız və italyan"

# Spelling out numbers
nii.numbers.spellout 115            # => "bir yüz on beş"
nii.numbers.spellout 1              # => "bir"
nii.numbers.spellout 2020, :year    # => "iki min iyirmi"
nii.numbers.spellout 115,  :ordinal # => "bir yüz on beşinci"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Azerbaijani</td>
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
      <td>gündüz</td>
      <td>12:00 to 17:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>axşamüstü</td>
      <td>17:00 to 19:00</td>
    </tr>
    <tr>
      <td>midnight</td>
      <td>midnight</td>
      <td>gecəyarı</td>
      <td>at 00:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>sübh</td>
      <td>04:00 to 06:00</td>
    </tr>
    <tr>
      <td>morning2</td>
      <td>morning</td>
      <td>səhər</td>
      <td>06:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>axşam</td>
      <td>19:00 to 24:00</td>
    </tr>
    <tr>
      <td>night2</td>
      <td>night</td>
      <td>gecə</td>
      <td>00:00 to 04:00</td>
    </tr>
    <tr>
      <td>noon</td>
      <td>noon</td>
      <td>günorta</td>
      <td>at 12:00</td>
    </tr>
  </tbody>
</table>


## Variants

<table>
  <thead>
    <tr>
      <th>Subtag</th>
      <th>Description</th>
      <th>Comments</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>baku1926</code></td>
      <td>Unified Turkic Latin Alphabet (Historical)</td>
      <td>Denotes alphabet used in Turkic republics/regions of the former USSR in late 1920s, and throughout 1930s, which aspired to represent equivalent phonemes in a unified fashion. Also known as: New Turkic Alphabet; Birlәşdirilmiş Jeni Tyrk Әlifbasь (Birlesdirilmis Jeni Tyrk Elifbasi); Jaŋalif (Janalif).</td>
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
      <td><code>az-Arab</code></td>
      <td><code>nii-extra-locales</code></td>
      <td>Azerbaijani (Arabic)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>az-Cyrl</code></td>
      <td><code>nii-extra-locales</code></td>
      <td>Azerbaijani (Cyrillic)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>az-Cyrl-AZ</code></td>
      <td><code>nii-core</code></td>
      <td>Azerbaijani (Cyrillic, Azerbaijan)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>az-Latn</code></td>
      <td><code>nii-core</code></td>
      <td>Azerbaijani (Latin)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>az-Latn-AZ</code></td>
      <td><code>nii-core</code></td>
      <td>Azerbaijani (Latin, Azerbaijan)</td>
      <td><code>az</code>, <code>aze</code>, and <code>azj</code></td>
    </tr>
  </tbody>
</table>

