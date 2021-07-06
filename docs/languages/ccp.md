<!-- This file has been generated. Source: languages/_template.md.erb -->

# Chakma

## Installation

In order to use Chakma with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Chakma
nii = Nii::Context.new "ccp" # => #<Nii::Context:ccp-BD>

# Value formatting
nii.format 9.99, style: :currency            # => "𑄿.𑄿𑄿৳"
nii.format Nii::Territory["BD"]              # => "𑄝𑄁𑄣𑄘𑄬𑄌𑄴"
nii.format ["de", "fr", "it"], as: :language # => "𑄎𑄢𑄴𑄟𑄚𑄴, 𑄜𑄧𑄢𑄥𑄨 𑄃𑄳𑄃 𑄃𑄨𑄖𑄣𑄩𑄠𑄧"

# Spelling out numbers
nii.spellout 115                  # => "𑄆𑄇𑄴𑄥𑄧 𑄛𑄧𑄚𑄴𑄘𑄳𑄢𑄧"
nii.spellout 1                    # => "𑄆𑄇𑄴"
nii.spellout 2020, rule: :year    # => "𑄘𑄨 𑄦𑄎𑄢𑄴 𑄇𑄪𑄢𑄨"
nii.spellout 115,  rule: :ordinal # => "𑄆𑄇𑄴𑄥𑄧 𑄛𑄧𑄚𑄴𑄘𑄳𑄢𑄧 𑄛𑄳𑄆𑄘𑄳𑄠𑄬"

# With RubyMoney
price = Money.eur 15_00
nii.format   price # => "𑄷𑄻.𑄶𑄶€"
nii.spellout price # => "𑄛𑄧𑄚𑄴𑄘𑄳𑄢𑄧 𑄃𑄨𑄅𑄪𑄢𑄮"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Chakma</td>
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
      <td>𑄘𑄨𑄝𑄪𑄎𑄳𑄠</td>
      <td>12:00 to 16:00</td>
    </tr>
    <tr>
      <td>afternoon2</td>
      <td>afternoon</td>
      <td>𑄝𑄬𑄣𑄳𑄠𑄬</td>
      <td>16:00 to 18:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>𑄥𑄎𑄧𑄚𑄳𑄠</td>
      <td>18:00 to 20:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>𑄛𑄧𑄖𑄳𑄠𑄃𑄟𑄧𑄣𑄳𑄠𑄬</td>
      <td>04:00 to 06:00</td>
    </tr>
    <tr>
      <td>morning2</td>
      <td>morning</td>
      <td>𑄝𑄬𑄚𑄳𑄠𑄬</td>
      <td>06:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>𑄢𑄬𑄖𑄴</td>
      <td>20:00 to 04:00</td>
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
      <td><code>ccp-BD</code></td>
      <td>Chakma (Bangladesh)</td>
      <td><code>ccp</code></td>
    </tr>
    <tr>
      <td><code>ccp-IN</code></td>
      <td>Chakma (India)</td>
      <td></td>
    </tr>
  </tbody>
</table>

