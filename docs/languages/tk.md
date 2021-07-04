<!-- This file has been generated. Source: languages/_template.md.erb -->

# Turkmen

## Installation

You do not need any additional libraries to use Turkmen with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Turkmen
nii = Nii::Context.new "tk" # => #<Nii::Context:tk-TM>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 TMT"
nii.format Nii::Territory["TM"]              # => "Türkmenistan"
nii.format ["de", "fr", "it"], as: :language # => "nemes dili, fransuz dili we italýan dili"
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
      <td><code>tk-TM</code></td>
      <td>Turkmen (Turkmenistan)</td>
      <td><code>tk</code> and <code>tuk</code></td>
    </tr>
  </tbody>
</table>

