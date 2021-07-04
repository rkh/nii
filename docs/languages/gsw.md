<!-- This file has been generated. Source: languages/_template.md.erb -->

# Swiss German

## Installation

In order to use Swiss German with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Swiss German
nii = Nii::Context.new "gsw" # => #<Nii::Context:gsw-CH>

# Value formatting
nii.format 9.99, style: :currency            # => "9.99 CHF"
nii.format Nii::Territory["CH"]              # => "Schwiiz"
nii.format ["de", "fr", "it"], as: :language # => "Tüütsch, Französisch und Italiänisch"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Swiss German</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>Vormittag</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>Namittag</td>
      <td>12:00 to 24:00</td>
    </tr>
    <tr>
      <td>afternoon1</td>
      <td>afternoon</td>
      <td>Mittag</td>
      <td>12:00 to 14:00</td>
    </tr>
    <tr>
      <td>afternoon2</td>
      <td>afternoon</td>
      <td>Namittag</td>
      <td>14:00 to 18:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>Aabig</td>
      <td>18:00 to 24:00</td>
    </tr>
    <tr>
      <td>midnight</td>
      <td>midnight</td>
      <td>Mitternacht</td>
      <td>at 00:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>Morge</td>
      <td>05:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>Nacht</td>
      <td>00:00 to 05:00</td>
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
      <td><code>gsw-CH</code></td>
      <td>Swiss German (Switzerland)</td>
      <td><code>gsw</code></td>
    </tr>
    <tr>
      <td><code>gsw-FR</code></td>
      <td>Swiss German (France)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>gsw-LI</code></td>
      <td>Swiss German (Liechtenstein)</td>
      <td></td>
    </tr>
  </tbody>
</table>

