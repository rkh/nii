<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

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
nii.spellout 115                  # => "бир жүз он беш"
nii.spellout 1                    # => "бир"
nii.spellout 2020, rule: :year    # => "эки миң жыйырма"
nii.spellout 115,  rule: :ordinal # => "бир жүз он бешинчи"

# With RubyMoney
price = Money.eur 15_00
nii.format   price # => "15,00 €"
nii.spellout price # => "он беш евро"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Kyrgyz</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>таңкы</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>түштөн кийинки</td>
      <td>12:00 to 24:00</td>
    </tr>
    <tr>
      <td>afternoon1</td>
      <td>afternoon</td>
      <td>түштөн кийин</td>
      <td>12:00 to 18:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>кечкурун</td>
      <td>18:00 to 21:00</td>
    </tr>
    <tr>
      <td>midnight</td>
      <td>midnight</td>
      <td>түн ортосу</td>
      <td>at 00:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>эртең менен</td>
      <td>06:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>түн</td>
      <td>21:00 to 06:00</td>
    </tr>
    <tr>
      <td>noon</td>
      <td>noon</td>
      <td>чак түш</td>
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

