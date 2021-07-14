<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Sakha

## Installation

In order to use Sakha with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Sakha
nii = Nii::Context.new "sah" # => #<Nii::Context:sah-RU>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 ₽"
nii.format Nii::Territory["RU"]              # => "Арассыыйа"
nii.format ["de", "fr", "it"], as: :language # => "Ниэмэстии, Боронсуустуу уонна Ытаалыйалыы"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Sakha</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>ЭИ</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>ЭК</td>
      <td>12:00 to 24:00</td>
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
      <th>Description</th>
      <th>Aliases</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>sah-RU</code></td>
      <td>Sakha (Russia)</td>
      <td><code>sah</code></td>
    </tr>
  </tbody>
</table>

