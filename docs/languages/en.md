<!-- This file has been generated. Source: languages/_template.md.erb -->

# English

## Installation

You do not need any additional libraries to use English with Nii.
However, you do need to install `nii-extra-locales` in order to use English (Deseret) or English (Shavian).
See the [list of locales](#locales) below.

## Example Usage

``` ruby
# Create a context for English
nii = Nii::Context.new "en" # => #<Nii::Context:en-US>

# Value formatting
nii.format 9.99, style: :currency            # => "$9.99"
nii.format Nii::Territory["US"]              # => "United States"
nii.format ["de", "fr", "it"], as: :language # => "German, French, and Italian"

# Spelling out numbers
nii.spellout 115                              # => "one hundred fifteen"
nii.spellout 1                                # => "one"
nii.spellout 2020                             # => "two thousand twenty"
nii.spellout 2020, rule: :year                # => "twenty twenty"
nii.spellout 115,  rule: :verbose             # => "one hundred and fifteen"
nii.spellout 115,  rule: :ordinal             # => "one hundred fifteenth"
nii.spellout 115,  rule: [:ordinal, :verbose] # => "one hundred and fifteenth"

# With RubyMoney
price = Money.eur 15_00
nii.format   price # => "€15.00"
nii.spellout price # => "fifteen euros"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in English</td>
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
      <td>afternoon</td>
      <td>12:00 to 18:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>evening</td>
      <td>18:00 to 21:00</td>
    </tr>
    <tr>
      <td>midnight</td>
      <td>midnight</td>
      <td>midnight</td>
      <td>at 00:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>morning</td>
      <td>06:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>night</td>
      <td>21:00 to 06:00</td>
    </tr>
    <tr>
      <td>noon</td>
      <td>noon</td>
      <td>noon</td>
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
      <td><code>basiceng</code></td>
      <td>Basic English</td>
      <td></td>
    </tr>
    <tr>
      <td><code>boont</code></td>
      <td>Boontling</td>
      <td>Jargon embedded in American English</td>
    </tr>
    <tr>
      <td><code>cornu</code></td>
      <td>Cornu-English / Cornish English / Anglo-Cornish</td>
      <td></td>
    </tr>
    <tr>
      <td><code>emodeng</code></td>
      <td>Early Modern English (1500-1700)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>oxendict</code></td>
      <td>Oxford English Dictionary spelling</td>
      <td></td>
    </tr>
    <tr>
      <td><code>scotland</code></td>
      <td>Scottish Standard English</td>
      <td></td>
    </tr>
    <tr>
      <td><code>scouse</code></td>
      <td>Scouse</td>
      <td>English Liverpudlian dialect known as 'Scouse'</td>
    </tr>
    <tr>
      <td><code>spanglis</code></td>
      <td>Spanglish</td>
      <td>A variety of contact dialects of English and Spanish</td>
    </tr>
    <tr>
      <td><code>unifon</code></td>
      <td>Unifon phonetic alphabet</td>
      <td></td>
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
      <td><code>en-001</code></td>
      <td><code>nii-core</code></td>
      <td>English (world)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-150</code></td>
      <td><code>nii-core</code></td>
      <td>English (Europe)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-AE</code></td>
      <td><code>nii-core</code></td>
      <td>English (United Arab Emirates)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-AG</code></td>
      <td><code>nii-core</code></td>
      <td>English (Antigua &amp; Barbuda)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-AI</code></td>
      <td><code>nii-core</code></td>
      <td>English (Anguilla)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-AS</code></td>
      <td><code>nii-core</code></td>
      <td>English (American Samoa)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-AT</code></td>
      <td><code>nii-core</code></td>
      <td>English (Austria)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-AU</code></td>
      <td><code>nii-core</code></td>
      <td>Australian English</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-BB</code></td>
      <td><code>nii-core</code></td>
      <td>English (Barbados)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-BE</code></td>
      <td><code>nii-core</code></td>
      <td>English (Belgium)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-BI</code></td>
      <td><code>nii-core</code></td>
      <td>English (Burundi)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-BM</code></td>
      <td><code>nii-core</code></td>
      <td>English (Bermuda)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-BS</code></td>
      <td><code>nii-core</code></td>
      <td>English (Bahamas)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-BW</code></td>
      <td><code>nii-core</code></td>
      <td>English (Botswana)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-BZ</code></td>
      <td><code>nii-core</code></td>
      <td>English (Belize)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-CA</code></td>
      <td><code>nii-core</code></td>
      <td>Canadian English</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-CC</code></td>
      <td><code>nii-core</code></td>
      <td>English (Cocos (Keeling) Islands)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-CH</code></td>
      <td><code>nii-core</code></td>
      <td>English (Switzerland)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-CK</code></td>
      <td><code>nii-core</code></td>
      <td>English (Cook Islands)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-CM</code></td>
      <td><code>nii-core</code></td>
      <td>English (Cameroon)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-CX</code></td>
      <td><code>nii-core</code></td>
      <td>English (Christmas Island)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-CY</code></td>
      <td><code>nii-core</code></td>
      <td>English (Cyprus)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-DE</code></td>
      <td><code>nii-core</code></td>
      <td>English (Germany)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-DG</code></td>
      <td><code>nii-core</code></td>
      <td>English (Diego Garcia)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-DK</code></td>
      <td><code>nii-core</code></td>
      <td>English (Denmark)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-DM</code></td>
      <td><code>nii-core</code></td>
      <td>English (Dominica)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-ER</code></td>
      <td><code>nii-core</code></td>
      <td>English (Eritrea)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-FI</code></td>
      <td><code>nii-core</code></td>
      <td>English (Finland)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-FJ</code></td>
      <td><code>nii-core</code></td>
      <td>English (Fiji)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-FK</code></td>
      <td><code>nii-core</code></td>
      <td>English (Falkland Islands)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-FM</code></td>
      <td><code>nii-core</code></td>
      <td>English (Micronesia)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-GB</code></td>
      <td><code>nii-core</code></td>
      <td>British English</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-GD</code></td>
      <td><code>nii-core</code></td>
      <td>English (Grenada)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-GG</code></td>
      <td><code>nii-core</code></td>
      <td>English (Guernsey)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-GH</code></td>
      <td><code>nii-core</code></td>
      <td>English (Ghana)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-GI</code></td>
      <td><code>nii-core</code></td>
      <td>English (Gibraltar)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-GM</code></td>
      <td><code>nii-core</code></td>
      <td>English (Gambia)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-GU</code></td>
      <td><code>nii-core</code></td>
      <td>English (Guam)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-GY</code></td>
      <td><code>nii-core</code></td>
      <td>English (Guyana)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-HK</code></td>
      <td><code>nii-core</code></td>
      <td>English (Hong Kong SAR China)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-IE</code></td>
      <td><code>nii-core</code></td>
      <td>English (Ireland)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-IL</code></td>
      <td><code>nii-core</code></td>
      <td>English (Israel)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-IM</code></td>
      <td><code>nii-core</code></td>
      <td>English (Isle of Man)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-IN</code></td>
      <td><code>nii-core</code></td>
      <td>English (India)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-IO</code></td>
      <td><code>nii-core</code></td>
      <td>English (British Indian Ocean Territory)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-JE</code></td>
      <td><code>nii-core</code></td>
      <td>English (Jersey)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-JM</code></td>
      <td><code>nii-core</code></td>
      <td>English (Jamaica)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-KE</code></td>
      <td><code>nii-core</code></td>
      <td>English (Kenya)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-KI</code></td>
      <td><code>nii-core</code></td>
      <td>English (Kiribati)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-KN</code></td>
      <td><code>nii-core</code></td>
      <td>English (St. Kitts &amp; Nevis)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-KY</code></td>
      <td><code>nii-core</code></td>
      <td>English (Cayman Islands)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-LC</code></td>
      <td><code>nii-core</code></td>
      <td>English (St. Lucia)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-LR</code></td>
      <td><code>nii-core</code></td>
      <td>English (Liberia)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-LS</code></td>
      <td><code>nii-core</code></td>
      <td>English (Lesotho)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-MG</code></td>
      <td><code>nii-core</code></td>
      <td>English (Madagascar)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-MH</code></td>
      <td><code>nii-core</code></td>
      <td>English (Marshall Islands)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-MO</code></td>
      <td><code>nii-core</code></td>
      <td>English (Macao SAR China)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-MP</code></td>
      <td><code>nii-core</code></td>
      <td>English (Northern Mariana Islands)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-MS</code></td>
      <td><code>nii-core</code></td>
      <td>English (Montserrat)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-MT</code></td>
      <td><code>nii-core</code></td>
      <td>English (Malta)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-MU</code></td>
      <td><code>nii-core</code></td>
      <td>English (Mauritius)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-MW</code></td>
      <td><code>nii-core</code></td>
      <td>English (Malawi)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-MY</code></td>
      <td><code>nii-core</code></td>
      <td>English (Malaysia)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-NA</code></td>
      <td><code>nii-core</code></td>
      <td>English (Namibia)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-NF</code></td>
      <td><code>nii-core</code></td>
      <td>English (Norfolk Island)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-NG</code></td>
      <td><code>nii-core</code></td>
      <td>English (Nigeria)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-NL</code></td>
      <td><code>nii-core</code></td>
      <td>English (Netherlands)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-NR</code></td>
      <td><code>nii-core</code></td>
      <td>English (Nauru)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-NU</code></td>
      <td><code>nii-core</code></td>
      <td>English (Niue)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-NZ</code></td>
      <td><code>nii-core</code></td>
      <td>English (New Zealand)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-PG</code></td>
      <td><code>nii-core</code></td>
      <td>English (Papua New Guinea)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-PH</code></td>
      <td><code>nii-core</code></td>
      <td>English (Philippines)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-PK</code></td>
      <td><code>nii-core</code></td>
      <td>English (Pakistan)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-PN</code></td>
      <td><code>nii-core</code></td>
      <td>English (Pitcairn Islands)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-PR</code></td>
      <td><code>nii-core</code></td>
      <td>English (Puerto Rico)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-PW</code></td>
      <td><code>nii-core</code></td>
      <td>English (Palau)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-RW</code></td>
      <td><code>nii-core</code></td>
      <td>English (Rwanda)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-SB</code></td>
      <td><code>nii-core</code></td>
      <td>English (Solomon Islands)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-SC</code></td>
      <td><code>nii-core</code></td>
      <td>English (Seychelles)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-SD</code></td>
      <td><code>nii-core</code></td>
      <td>English (Sudan)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-SE</code></td>
      <td><code>nii-core</code></td>
      <td>English (Sweden)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-SG</code></td>
      <td><code>nii-core</code></td>
      <td>English (Singapore)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-SH</code></td>
      <td><code>nii-core</code></td>
      <td>English (St. Helena)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-SI</code></td>
      <td><code>nii-core</code></td>
      <td>English (Slovenia)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-SL</code></td>
      <td><code>nii-core</code></td>
      <td>English (Sierra Leone)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-SS</code></td>
      <td><code>nii-core</code></td>
      <td>English (South Sudan)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-SX</code></td>
      <td><code>nii-core</code></td>
      <td>English (Sint Maarten)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-SZ</code></td>
      <td><code>nii-core</code></td>
      <td>English (Eswatini)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-TC</code></td>
      <td><code>nii-core</code></td>
      <td>English (Turks &amp; Caicos Islands)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-TK</code></td>
      <td><code>nii-core</code></td>
      <td>English (Tokelau)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-TO</code></td>
      <td><code>nii-core</code></td>
      <td>English (Tonga)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-TT</code></td>
      <td><code>nii-core</code></td>
      <td>English (Trinidad &amp; Tobago)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-TV</code></td>
      <td><code>nii-core</code></td>
      <td>English (Tuvalu)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-TZ</code></td>
      <td><code>nii-core</code></td>
      <td>English (Tanzania)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-UG</code></td>
      <td><code>nii-core</code></td>
      <td>English (Uganda)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-UM</code></td>
      <td><code>nii-core</code></td>
      <td>English (U.S. Outlying Islands)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-US</code></td>
      <td><code>nii-core</code></td>
      <td>American English</td>
      <td><code>en</code>, <code>eng</code>, and <code>i-default</code></td>
    </tr>
    <tr>
      <td><code>en-US-posix</code></td>
      <td><code>nii-core</code></td>
      <td>American English (Computer)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-VC</code></td>
      <td><code>nii-core</code></td>
      <td>English (St. Vincent &amp; Grenadines)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-VG</code></td>
      <td><code>nii-core</code></td>
      <td>English (British Virgin Islands)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-VI</code></td>
      <td><code>nii-core</code></td>
      <td>English (U.S. Virgin Islands)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-VU</code></td>
      <td><code>nii-core</code></td>
      <td>English (Vanuatu)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-WS</code></td>
      <td><code>nii-core</code></td>
      <td>English (Samoa)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-ZA</code></td>
      <td><code>nii-core</code></td>
      <td>English (South Africa)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-ZM</code></td>
      <td><code>nii-core</code></td>
      <td>English (Zambia)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-ZW</code></td>
      <td><code>nii-core</code></td>
      <td>English (Zimbabwe)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-Dsrt</code></td>
      <td><code>nii-extra-locales</code></td>
      <td>English (Deseret)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>en-Shaw</code></td>
      <td><code>nii-extra-locales</code></td>
      <td>English (Shavian)</td>
      <td></td>
    </tr>
  </tbody>
</table>

