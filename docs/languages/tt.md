<!-- This file has been generated. Source: languages/_template.md.erb -->

# Tatar

## Installation

In order to use Tatar with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Tatar
nii = Nii::Context.new "tt" # => #<Nii::Context:tt-RU>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 ₽"
nii.format Nii::Territory["RU"]              # => "Россия"
nii.format ["de", "fr", "it"], as: :language # => "алман, француз һәм итальян"
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
      <th>Description</th>
      <th>Aliases</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>tt-RU</code></td>
      <td>Tatar (Russia)</td>
      <td><code>tt</code> and <code>tat</code></td>
    </tr>
  </tbody>
</table>

