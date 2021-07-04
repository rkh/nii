<!-- This file has been generated. Source: languages/_template.md.erb -->

# Unknown Language / Root Locale

The code `und` or `root` represents a locale without a specific language.
All other locales have this locale as their first ancestor.


## Example Usage

``` ruby
# Create a context for Unknown language
nii = Nii::Context.new "und" # => #<Nii::Context:und-001>

# Value formatting
nii.format 9.99, currency: "USD"             # => "US$ 9.99"
nii.format Nii::Territory["001"]             # => "001"
nii.format ["de", "fr", "it"], as: :language # => "de, fr, it"
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
      <td><code>und</code></td>
      <td>Unknown language</td>
      <td><code>i-enochian</code>, <code>und-arevela</code>, <code>und-arevmda</code>, <code>und-bokmal</code>, <code>und-hakka</code>, <code>und-lojban</code>, <code>und-nynorsk</code>, <code>und-saaho</code>, <code>und-xiang</code>, and <code>root</code></td>
    </tr>
  </tbody>
</table>

