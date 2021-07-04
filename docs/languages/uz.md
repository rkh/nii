<!-- This file has been generated. Source: languages/_template.md.erb -->

# Uzbek

## Installation

You do not need any additional libraries to use Uzbek with Nii.
However, you do need to install `nii-extra-locales` in order to use Uzbek (Arabic) or Uzbek (Cyrillic).
See the [list of locales](#locales) below.

## Example Usage

``` ruby
# Create a context for Uzbek
nii = Nii::Context.new "uz" # => #<Nii::Context:uz-Latn-UZ>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 soʻm"
nii.format Nii::Territory["UZ"]              # => "Oʻzbekiston"
nii.format ["de", "fr", "it"], as: :language # => "nemischa, fransuzcha va italyan"
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
      <td><code>uz-Arab</code></td>
      <td><code>nii-extra-locales</code></td>
      <td>Uzbek (Arabic)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>uz-Cyrl</code></td>
      <td><code>nii-extra-locales</code></td>
      <td>Uzbek (Cyrillic)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>uz-Arab-AF</code></td>
      <td><code>nii-core</code></td>
      <td>Uzbek (Arabic, Afghanistan)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>uz-Cyrl-UZ</code></td>
      <td><code>nii-core</code></td>
      <td>Uzbek (Cyrillic, Uzbekistan)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>uz-Latn</code></td>
      <td><code>nii-core</code></td>
      <td>Uzbek (Latin)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>uz-Latn-UZ</code></td>
      <td><code>nii-core</code></td>
      <td>Uzbek (Latin, Uzbekistan)</td>
      <td><code>uz</code>, <code>uzb</code>, and <code>uzn</code></td>
    </tr>
  </tbody>
</table>
