<!-- This file has been generated. Source: languages/_template.md.erb -->

# Yiddish

## Installation

In order to use Yiddish with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Yiddish
nii = Nii::Context.new "yi" # => #<Nii::Context:yi-001>

# Value formatting
nii.format 9.99, currency: "USD"             # => "US$ 9.99"
nii.format Nii::Territory["001"]             # => "וועלט"
nii.format ["de", "fr", "it"], as: :language # => "דײַטש, פֿראַנצויזיש און איטאַליעניש"
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
      <td><code>yi-001</code></td>
      <td>Yiddish (world)</td>
      <td><code>yi</code>, <code>ji</code>, <code>ydd</code>, and <code>yid</code></td>
    </tr>
  </tbody>
</table>

