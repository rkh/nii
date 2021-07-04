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

