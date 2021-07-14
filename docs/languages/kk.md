<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Kazakh

## Installation

You do not need any additional libraries to use Kazakh with Nii.
However, you do need to install `nii-extra-locales` in order to use Kazakh (Arabic).
See the [list of locales](#locales) below.

## Example Usage

``` ruby
# Create a context for Kazakh
nii = Nii::Context.new "kk" # => #<Nii::Context:kk-KZ>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 ₸"
nii.format Nii::Territory["KZ"]              # => "Қазақстан"
nii.format ["de", "fr", "it"], as: :language # => "неміс тілі, француз тілі, итальян тілі"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Kazakh</td>
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
      <td>түстен кейін</td>
      <td>12:00 to 18:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>кеш</td>
      <td>18:00 to 21:00</td>
    </tr>
    <tr>
      <td>midnight</td>
      <td>midnight</td>
      <td>түн жарымы</td>
      <td>at 00:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>таң</td>
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
      <td>талтүс</td>
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
      <td><code>kk-Arab</code></td>
      <td><code>nii-extra-locales</code></td>
      <td>Kazakh (Arabic)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>kk-KZ</code></td>
      <td><code>nii-core</code></td>
      <td>Kazakh (Kazakhstan)</td>
      <td><code>kk</code> and <code>kaz</code></td>
    </tr>
  </tbody>
</table>

