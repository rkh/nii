<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Norwegian Bokmål

## Installation

You do not need any additional libraries to use Norwegian Bokmål with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Norwegian Bokmål
nii = Nii::Context.new "nb" # => #<Nii::Context:nb-NO>

# Value formatting
nii.format 9.99, style: :currency            # => "kr 9,99"
nii.format Nii::Territory["NO"]              # => "Norge"
nii.format ["de", "fr", "it"], as: :language # => "tysk, fransk og italiensk"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Norwegian Bokmål</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>a.m.</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>p.m.</td>
      <td>12:00 to 24:00</td>
    </tr>
    <tr>
      <td>afternoon1</td>
      <td>afternoon</td>
      <td>ettermiddag</td>
      <td>12:00 to 18:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>kveld</td>
      <td>18:00 to 24:00</td>
    </tr>
    <tr>
      <td>midnight</td>
      <td>midnight</td>
      <td>midnatt</td>
      <td>at 00:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>morgen</td>
      <td>06:00 to 10:00</td>
    </tr>
    <tr>
      <td>morning2</td>
      <td>morning</td>
      <td>formiddag</td>
      <td>10:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>natt</td>
      <td>00:00 to 06:00</td>
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
      <td><code>nb-NO</code></td>
      <td>Norwegian Bokmål (Norway)</td>
      <td><code>nb</code>, <code>no-bok</code>, <code>no-bokmal</code>, and <code>nob</code></td>
    </tr>
    <tr>
      <td><code>nb-SJ</code></td>
      <td>Norwegian Bokmål (Svalbard &amp; Jan Mayen)</td>
      <td></td>
    </tr>
  </tbody>
</table>

