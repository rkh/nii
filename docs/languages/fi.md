<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Finnish

## Installation

You do not need any additional libraries to use Finnish with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Finnish
nii = Nii::Context.new "fi" # => #<Nii::Context:fi-FI>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 €"
nii.format Nii::Territory["FI"]              # => "Suomi"
nii.format ["de", "fr", "it"], as: :language # => "saksa, ranska ja italia"

# Spelling out numbers
nii.spellout 115                                           # => "sata­viisitoista"
nii.spellout 1                                             # => "yksi"
nii.spellout 2020, rule: :year                             # => "kaksi­tuhatta­kaksi­kymmentä"
nii.spellout 115,  rule: :genitive                         # => "sadan­viidentoista"
nii.spellout 115,  rule: :partitive                        # => "sataa­viittätoista"
nii.spellout 115,  rule: :essive                           # => "satana­viitenätoista"
nii.spellout 115,  rule: :translative                      # => "sadaksi­viideksitoista"
nii.spellout 115,  rule: :inessive                         # => "sadassa­viidessätoista"
nii.spellout 115,  rule: :elative                          # => "sadasta­viidestätoista"
nii.spellout 115,  rule: :illative                         # => "sataan­viiteentoista"
nii.spellout 115,  rule: :adessive                         # => "sadalla­viidellätoista"
nii.spellout 115,  rule: :ablative                         # => "sadalta­viideltätoista"
nii.spellout 115,  rule: :allative                         # => "sadalle­viidelletoista"
nii.spellout 115,  rule: :plural                           # => "sadat­viidettoista"
nii.spellout 115,  rule: [:genitive, :plural]              # => "satojen­viisientoista"
nii.spellout 115,  rule: [:partitive, :plural]             # => "satoja­viisiätoista"
nii.spellout 115,  rule: [:essive, :plural]                # => "satoina­viisinätoista"
nii.spellout 115,  rule: [:translative, :plural]           # => "sadoiksi­viisiksitoista"
nii.spellout 115,  rule: [:inessive, :plural]              # => "sadoissa­viisissätoista"
nii.spellout 115,  rule: [:elative, :plural]               # => "sadoista­viisistätoista"
nii.spellout 115,  rule: [:illative, :plural]              # => "satoihin­viisiintoista"
nii.spellout 115,  rule: [:adessive, :plural]              # => "sadoilla­viisillätoista"
nii.spellout 115,  rule: [:ablative, :plural]              # => "sadoilta­viisiltätoista"
nii.spellout 115,  rule: [:allative, :plural]              # => "sadoille­viisilletoista"
nii.spellout 115,  rule: :ordinal                          # => "sadas­viidestoista"
nii.spellout 115,  rule: [:ordinal, :genitive]             # => "sadannen­viidennentoista"
nii.spellout 115,  rule: [:ordinal, :partitive]            # => "sadatta­viidettätoista"
nii.spellout 115,  rule: [:ordinal, :essive]               # => "sadantena­viidentenätoista"
nii.spellout 115,  rule: [:ordinal, :translative]          # => "sadanneksi­viidenneksitoista"
nii.spellout 115,  rule: [:ordinal, :inessive]             # => "sadannessa­viidennessätoista"
nii.spellout 115,  rule: [:ordinal, :elative]              # => "sadannesta­viidennestätoista"
nii.spellout 115,  rule: [:ordinal, :illative]             # => "sadanteen­viidenteentoista"
nii.spellout 115,  rule: [:ordinal, :adessive]             # => "sadannella­viidennellätoista"
nii.spellout 115,  rule: [:ordinal, :ablative]             # => "sadannelta­viidenneltätoista"
nii.spellout 115,  rule: [:ordinal, :allative]             # => "sadannelle­viidennelletoista"
nii.spellout 115,  rule: [:ordinal, :plural]               # => "sadannet­viidennettoista"
nii.spellout 115,  rule: [:ordinal, :genitive, :plural]    # => "sadansien­viidensientoista"
nii.spellout 115,  rule: [:ordinal, :partitive, :plural]   # => "sadansia­viidensiätoista"
nii.spellout 115,  rule: [:ordinal, :essive, :plural]      # => "sadansina­viidensinätoista"
nii.spellout 115,  rule: [:ordinal, :translative, :plural] # => "sadansiksi­viidensiksitoista"
nii.spellout 115,  rule: [:ordinal, :inessive, :plural]    # => "sadansissa­viidensissätoista"
nii.spellout 115,  rule: [:ordinal, :elative, :plural]     # => "sadansista­viidensistätoista"
nii.spellout 115,  rule: [:ordinal, :illative, :plural]    # => "sadansiin­viidensiintoista"
nii.spellout 115,  rule: [:ordinal, :adessive, :plural]    # => "sadannilla­viidennillätoista"
nii.spellout 115,  rule: [:ordinal, :ablative, :plural]    # => "sadannilta­viidenniltätoista"
nii.spellout 115,  rule: [:ordinal, :allative, :plural]    # => "sadannille­viidennilletoista"

# With RubyMoney
price = Money.eur 15_00
nii.format   price # => "15,00 €"
nii.spellout price # => "viisitoista euroa"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Finnish</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>ap.</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>ip.</td>
      <td>12:00 to 24:00</td>
    </tr>
    <tr>
      <td>afternoon1</td>
      <td>afternoon</td>
      <td>iltapäivä</td>
      <td>12:00 to 18:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>ilta</td>
      <td>18:00 to 23:00</td>
    </tr>
    <tr>
      <td>midnight</td>
      <td>midnight</td>
      <td>keskiyö</td>
      <td>at 00:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>aamu</td>
      <td>05:00 to 10:00</td>
    </tr>
    <tr>
      <td>morning2</td>
      <td>morning</td>
      <td>aamupäivä</td>
      <td>10:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>yö</td>
      <td>23:00 to 05:00</td>
    </tr>
    <tr>
      <td>noon</td>
      <td>noon</td>
      <td>keskipäivä</td>
      <td>at 12:00</td>
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
      <td><code>fi-FI</code></td>
      <td>Finnish (Finland)</td>
      <td><code>fi</code> and <code>fin</code></td>
    </tr>
  </tbody>
</table>

