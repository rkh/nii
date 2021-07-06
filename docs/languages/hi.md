<!-- This file has been generated. Source: languages/_template.md.erb -->

# Hindi

## Installation

You do not need any additional libraries to use Hindi with Nii.
However, you do need to install `nii-extra-locales` in order to use Hindi (Latin).
See the [list of locales](#locales) below.

## Example Usage

``` ruby
# Create a context for Hindi
nii = Nii::Context.new "hi" # => #<Nii::Context:hi-IN>

# Value formatting
nii.format 9.99, style: :currency            # => "₹9.99"
nii.format Nii::Territory["IN"]              # => "भारत"
nii.format ["de", "fr", "it"], as: :language # => "जर्मन, फ़्रेंच, और इतालवी"

# Spelling out numbers
nii.spellout 115                                # => "एक सौ पन्द्रह"
nii.spellout 1                                  # => "एक"
nii.spellout 2020, rule: :year                  # => "दो हज़ार बीस"
nii.spellout 115,  rule: [:ordinal, :masculine] # => "एक सौ पन्द्रहवाँ"
nii.spellout 115,  rule: [:ordinal, :feminine]  # => "एक सौ पन्द्रहवी"

# With RubyMoney
price = Money.eur 15_00
nii.format   price # => "€15.00"
nii.spellout price # => "पन्द्रह यूरो"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Hindi</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>am</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>pm</td>
      <td>12:00 to 24:00</td>
    </tr>
    <tr>
      <td>afternoon1</td>
      <td>afternoon</td>
      <td>दोपहर</td>
      <td>12:00 to 16:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>शाम</td>
      <td>16:00 to 20:00</td>
    </tr>
    <tr>
      <td>midnight</td>
      <td>midnight</td>
      <td>मध्यरात्रि</td>
      <td>at 00:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>सुबह</td>
      <td>04:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>रात</td>
      <td>20:00 to 04:00</td>
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
      <td><code>hi-IN</code></td>
      <td><code>nii-core</code></td>
      <td>Hindi (India)</td>
      <td><code>hi</code> and <code>hin</code></td>
    </tr>
    <tr>
      <td><code>hi-Latn</code></td>
      <td><code>nii-extra-locales</code></td>
      <td>Hindi (Latin)</td>
      <td></td>
    </tr>
  </tbody>
</table>

