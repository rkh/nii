<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Pashto

## Installation

You do not need any additional libraries to use Pashto with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Pashto
nii = Nii::Context.new "ps" # => #<Nii::Context:ps-AF>

# Value formatting
nii.format 9.99, style: :currency            # => "۹٫۹۹ ؋"
nii.format Nii::Territory["AF"]              # => "افغانستان"
nii.format ["de", "fr", "it"], as: :language # => "الماني، فرانسوي، او ایټالوي"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Pashto</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>غ.م.</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>غ.و.</td>
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
      <td><code>ps-AF</code></td>
      <td>Pashto (Afghanistan)</td>
      <td><code>ps</code>, <code>pbu</code>, and <code>pus</code></td>
    </tr>
    <tr>
      <td><code>ps-PK</code></td>
      <td>Pashto (Pakistan)</td>
      <td></td>
    </tr>
  </tbody>
</table>

