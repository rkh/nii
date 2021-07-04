<!-- This file has been generated. Source: languages/_template.md.erb -->

# Arabic

## Installation

You do not need any additional libraries to use Arabic with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Arabic
nii = Nii::Context.new "ar" # => #<Nii::Context:ar-001>

# Value formatting
nii.format 9.99, currency: "USD"             # => "٩٫٩٩ US$"
nii.format Nii::Territory["001"]             # => "العالم"
nii.format ["de", "fr", "it"], as: :language # => "الألمانية والفرنسية والإيطالية"

# Spelling out numbers
nii.numbers.spellout 115                        # => "مائة و خمسة عشر"
nii.numbers.spellout 1                          # => "واحد"
nii.numbers.spellout 2020, :year                # => "ألفين و عشرون"
nii.numbers.spellout 1,    :feminine            # => "واحدة"
nii.numbers.spellout 115,  :ordinal, :feminine  # => "المائة و خمسة عشر"
nii.numbers.spellout 115,  :ordinal, :masculine # => "المائة و خمسة عشر"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Arabic</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>صباحًا</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>مساءً</td>
      <td>12:00 to 24:00</td>
    </tr>
    <tr>
      <td>afternoon1</td>
      <td>afternoon</td>
      <td>ظهرًا</td>
      <td>12:00 to 13:00</td>
    </tr>
    <tr>
      <td>afternoon2</td>
      <td>afternoon</td>
      <td>بعد الظهر</td>
      <td>13:00 to 18:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>مساءً</td>
      <td>18:00 to 24:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>فجرًا</td>
      <td>03:00 to 06:00</td>
    </tr>
    <tr>
      <td>morning2</td>
      <td>morning</td>
      <td>صباحًا</td>
      <td>06:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>منتصف الليل</td>
      <td>00:00 to 01:00</td>
    </tr>
    <tr>
      <td>night2</td>
      <td>night</td>
      <td>ليلاً</td>
      <td>01:00 to 03:00</td>
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
      <td><code>ar-001</code></td>
      <td>Modern Standard Arabic</td>
      <td><code>ar</code>, <code>ara</code>, and <code>arb</code></td>
    </tr>
    <tr>
      <td><code>ar-AE</code></td>
      <td>Arabic (United Arab Emirates)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ar-BH</code></td>
      <td>Arabic (Bahrain)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ar-DJ</code></td>
      <td>Arabic (Djibouti)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ar-DZ</code></td>
      <td>Arabic (Algeria)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ar-EG</code></td>
      <td>Arabic (Egypt)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ar-EH</code></td>
      <td>Arabic (Western Sahara)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ar-ER</code></td>
      <td>Arabic (Eritrea)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ar-IL</code></td>
      <td>Arabic (Israel)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ar-IQ</code></td>
      <td>Arabic (Iraq)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ar-JO</code></td>
      <td>Arabic (Jordan)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ar-KM</code></td>
      <td>Arabic (Comoros)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ar-KW</code></td>
      <td>Arabic (Kuwait)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ar-LB</code></td>
      <td>Arabic (Lebanon)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ar-LY</code></td>
      <td>Arabic (Libya)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ar-MA</code></td>
      <td>Arabic (Morocco)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ar-MR</code></td>
      <td>Arabic (Mauritania)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ar-OM</code></td>
      <td>Arabic (Oman)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ar-PS</code></td>
      <td>Arabic (Palestinian Territories)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ar-QA</code></td>
      <td>Arabic (Qatar)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ar-SA</code></td>
      <td>Arabic (Saudi Arabia)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ar-SD</code></td>
      <td>Arabic (Sudan)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ar-SO</code></td>
      <td>Arabic (Somalia)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ar-SS</code></td>
      <td>Arabic (South Sudan)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ar-SY</code></td>
      <td>Arabic (Syria)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ar-TD</code></td>
      <td>Arabic (Chad)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ar-TN</code></td>
      <td>Arabic (Tunisia)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ar-YE</code></td>
      <td>Arabic (Yemen)</td>
      <td></td>
    </tr>
  </tbody>
</table>

