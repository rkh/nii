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
nii.numbers.spellout 115            # => "𑄆𑄇𑄴𑄥𑄧 𑄛𑄧𑄚𑄴𑄘𑄳𑄢𑄧"
nii.numbers.spellout 1              # => "𑄆𑄇𑄴"
nii.numbers.spellout 2020, :year    # => "𑄘𑄨 𑄦𑄎𑄢𑄴 𑄇𑄪𑄢𑄨"
nii.numbers.spellout 115,  :ordinal # => "𑄆𑄇𑄴𑄥𑄧 𑄛𑄧𑄚𑄴𑄘𑄳𑄢𑄧 𑄛𑄳𑄆𑄘𑄳𑄠𑄬"
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

