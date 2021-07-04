<!-- This file has been generated. Source: languages/_template.md.erb -->

# Kyrgyz

## Installation

You do not need any additional libraries to use Kyrgyz with Nii.
However, you do need to install `nii-extra-locales` in order to use Kyrgyz (Arabic) or Kyrgyz (Latin).
See the [list of locales](#locales) below.

## Example Usage

``` ruby
# Create a context for Kyrgyz
nii = Nii::Context.new "ky" # => #<Nii::Context:ky-KG>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 сом"
nii.format Nii::Territory["KG"]              # => "Кыргызстан"
nii.format ["de", "fr", "it"], as: :language # => "немисче, французча жана италиянча"

# Spelling out numbers
nii.numbers.spellout 115            # => "бир жүз он беш"
nii.numbers.spellout 1              # => "бир"
nii.numbers.spellout 2020, :year    # => "эки миң жыйырма"
nii.numbers.spellout 115,  :verbose # => "бир жүз жана он беш"
nii.numbers.spellout 115,  :ordinal # => "бир жүз он бешинчи"
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
      <td><code>ky-Arab</code></td>
      <td><code>nii-extra-locales</code></td>
      <td>Kyrgyz (Arabic)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ky-Latn</code></td>
      <td><code>nii-extra-locales</code></td>
      <td>Kyrgyz (Latin)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ky-KG</code></td>
      <td><code>nii-core</code></td>
      <td>Kyrgyz (Kyrgyzstan)</td>
      <td><code>ky</code> and <code>kir</code></td>
    </tr>
  </tbody>
</table>

