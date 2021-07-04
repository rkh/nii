<!-- This file has been generated. Source: languages/_template.md.erb -->

# Fulah

## Installation

In order to use Fulah with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Fulah
nii = Nii::Context.new "ff" # => #<Nii::Context:ff-Latn-SN>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 F CFA"
nii.format Nii::Territory["SN"]              # => "Senegaal"
nii.format ["de", "fr", "it"], as: :language # => "Docceere, Farayseere, Italiyeere"

# Spelling out numbers
nii.numbers.spellout 115              # => "temedere goʼo e sappo e jowi"
nii.numbers.spellout 1                # => "goʼo"
nii.numbers.spellout 2020, :year      # => "ujunere ɗiɗi e noogas"
nii.numbers.spellout 115,  :class, :o # => "temedere gooto e sappo e njowo"
nii.numbers.spellout 115,  :ordinal   # => "temedere arande e sappo e jowaɓo"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Fulah</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>subaka</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>kikiiɗe</td>
      <td>12:00 to 24:00</td>
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
      <td><code>ff-Adlm</code></td>
      <td>Fulah (Adlam)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ff-Adlm-BF</code></td>
      <td>Fulah (Adlam, Burkina Faso)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ff-Adlm-CM</code></td>
      <td>Fulah (Adlam, Cameroon)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ff-Adlm-GH</code></td>
      <td>Fulah (Adlam, Ghana)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ff-Adlm-GM</code></td>
      <td>Fulah (Adlam, Gambia)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ff-Adlm-GN</code></td>
      <td>Fulah (Adlam, Guinea)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ff-Adlm-GW</code></td>
      <td>Fulah (Adlam, Guinea-Bissau)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ff-Adlm-LR</code></td>
      <td>Fulah (Adlam, Liberia)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ff-Adlm-MR</code></td>
      <td>Fulah (Adlam, Mauritania)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ff-Adlm-NE</code></td>
      <td>Fulah (Adlam, Niger)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ff-Adlm-NG</code></td>
      <td>Fulah (Adlam, Nigeria)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ff-Adlm-SL</code></td>
      <td>Fulah (Adlam, Sierra Leone)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ff-Adlm-SN</code></td>
      <td>Fulah (Adlam, Senegal)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ff-Arab</code></td>
      <td>Fulah (Arabic)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ff-Latn</code></td>
      <td>Fulah (Latin)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ff-Latn-BF</code></td>
      <td>Fulah (Latin, Burkina Faso)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ff-Latn-CM</code></td>
      <td>Fulah (Latin, Cameroon)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ff-Latn-GH</code></td>
      <td>Fulah (Latin, Ghana)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ff-Latn-GM</code></td>
      <td>Fulah (Latin, Gambia)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ff-Latn-GN</code></td>
      <td>Fulah (Latin, Guinea)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ff-Latn-GW</code></td>
      <td>Fulah (Latin, Guinea-Bissau)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ff-Latn-LR</code></td>
      <td>Fulah (Latin, Liberia)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ff-Latn-MR</code></td>
      <td>Fulah (Latin, Mauritania)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ff-Latn-NE</code></td>
      <td>Fulah (Latin, Niger)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ff-Latn-NG</code></td>
      <td>Fulah (Latin, Nigeria)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ff-Latn-SL</code></td>
      <td>Fulah (Latin, Sierra Leone)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ff-Latn-SN</code></td>
      <td>Fulah (Latin, Senegal)</td>
      <td><code>ff</code>, <code>fuc</code>, and <code>ful</code></td>
    </tr>
  </tbody>
</table>

