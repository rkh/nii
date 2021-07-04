<!-- This file has been generated. Source: languages/_template.md.erb -->

# Russian

## Installation

You do not need any additional libraries to use Russian with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Russian
nii = Nii::Context.new "ru" # => #<Nii::Context:ru-RU>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 ₽"
nii.format Nii::Territory["RU"]              # => "Россия"
nii.format ["de", "fr", "it"], as: :language # => "немецкий, французский и итальянский"
```

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
      <td><code>luna1918</code></td>
      <td>Post-1917 Russian orthography</td>
      <td>Russian orthography as established by the 1917/1918 orthographic reforms</td>
    </tr>
    <tr>
      <td><code>petr1708</code></td>
      <td>Petrine orthography</td>
      <td>Russian orthography from the Petrine orthographic reforms of 1708 to the 1917 orthographic reform</td>
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
      <td><code>ru-BY</code></td>
      <td>Russian (Belarus)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ru-KG</code></td>
      <td>Russian (Kyrgyzstan)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ru-KZ</code></td>
      <td>Russian (Kazakhstan)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ru-MD</code></td>
      <td>Russian (Moldova)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ru-RU</code></td>
      <td>Russian (Russia)</td>
      <td><code>ru</code> and <code>rus</code></td>
    </tr>
    <tr>
      <td><code>ru-UA</code></td>
      <td>Russian (Ukraine)</td>
      <td></td>
    </tr>
  </tbody>
</table>

