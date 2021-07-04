<!-- This file has been generated. Source: languages/_template.md.erb -->

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
nii.numbers.spellout 115                                     # => "sata­viisitoista"
nii.numbers.spellout 1                                       # => "yksi"
nii.numbers.spellout 2020, :year                             # => "kaksi­tuhatta­kaksi­kymmentä"
nii.numbers.spellout 115,  :genitive                         # => "sadan­viidentoista"
nii.numbers.spellout 115,  :partitive                        # => "sataa­viittätoista"
nii.numbers.spellout 115,  :essive                           # => "satana­viitenätoista"
nii.numbers.spellout 115,  :translative                      # => "sadaksi­viideksitoista"
nii.numbers.spellout 115,  :inessive                         # => "sadassa­viidessätoista"
nii.numbers.spellout 115,  :elative                          # => "sadasta­viidestätoista"
nii.numbers.spellout 115,  :illative                         # => "sataan­viiteentoista"
nii.numbers.spellout 115,  :adessive                         # => "sadalla­viidellätoista"
nii.numbers.spellout 115,  :ablative                         # => "sadalta­viideltätoista"
nii.numbers.spellout 115,  :allative                         # => "sadalle­viidelletoista"
nii.numbers.spellout 115,  :plural                           # => "sadat­viidettoista"
nii.numbers.spellout 115,  :genitive,  :plural               # => "satojen­viisientoista"
nii.numbers.spellout 115,  :partitive, :plural               # => "satoja­viisiätoista"
nii.numbers.spellout 115,  :essive,    :plural               # => "satoina­viisinätoista"
nii.numbers.spellout 115,  :translative, :plural             # => "sadoiksi­viisiksitoista"
nii.numbers.spellout 115,  :inessive,  :plural               # => "sadoissa­viisissätoista"
nii.numbers.spellout 115,  :elative,   :plural               # => "sadoista­viisistätoista"
nii.numbers.spellout 115,  :illative,  :plural               # => "satoihin­viisiintoista"
nii.numbers.spellout 115,  :adessive,  :plural               # => "sadoilla­viisillätoista"
nii.numbers.spellout 115,  :ablative,  :plural               # => "sadoilta­viisiltätoista"
nii.numbers.spellout 115,  :allative,  :plural               # => "sadoille­viisilletoista"
nii.numbers.spellout 115,  :ordinal                          # => "sadas­viidestoista"
nii.numbers.spellout 115,  :ordinal,   :genitive             # => "sadannen­viidennentoista"
nii.numbers.spellout 115,  :ordinal,   :partitive            # => "sadatta­viidettätoista"
nii.numbers.spellout 115,  :ordinal,   :essive               # => "sadantena­viidentenätoista"
nii.numbers.spellout 115,  :ordinal,   :translative          # => "sadanneksi­viidenneksitoista"
nii.numbers.spellout 115,  :ordinal,   :inessive             # => "sadannessa­viidennessätoista"
nii.numbers.spellout 115,  :ordinal,   :elative              # => "sadannesta­viidennestätoista"
nii.numbers.spellout 115,  :ordinal,   :illative             # => "sadanteen­viidenteentoista"
nii.numbers.spellout 115,  :ordinal,   :adessive             # => "sadannella­viidennellätoista"
nii.numbers.spellout 115,  :ordinal,   :ablative             # => "sadannelta­viidenneltätoista"
nii.numbers.spellout 115,  :ordinal,   :allative             # => "sadannelle­viidennelletoista"
nii.numbers.spellout 115,  :ordinal,   :plural               # => "sadannet­viidennettoista"
nii.numbers.spellout 115,  :ordinal,   :genitive,  :plural   # => "sadansien­viidensientoista"
nii.numbers.spellout 115,  :ordinal,   :partitive, :plural   # => "sadansia­viidensiätoista"
nii.numbers.spellout 115,  :ordinal,   :essive,    :plural   # => "sadansina­viidensinätoista"
nii.numbers.spellout 115,  :ordinal,   :translative, :plural # => "sadansiksi­viidensiksitoista"
nii.numbers.spellout 115,  :ordinal,   :inessive,  :plural   # => "sadansissa­viidensissätoista"
nii.numbers.spellout 115,  :ordinal,   :elative,   :plural   # => "sadansista­viidensistätoista"
nii.numbers.spellout 115,  :ordinal,   :illative,  :plural   # => "sadansiin­viidensiintoista"
nii.numbers.spellout 115,  :ordinal,   :adessive,  :plural   # => "sadannilla­viidennillätoista"
nii.numbers.spellout 115,  :ordinal,   :ablative,  :plural   # => "sadannilta­viidenniltätoista"
nii.numbers.spellout 115,  :ordinal,   :allative,  :plural   # => "sadannille­viidennilletoista"
```


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

