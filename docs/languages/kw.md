<!-- This file has been generated. Source: languages/_template.md.erb -->

# Cornish

## Installation

In order to use Cornish with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Cornish
nii = Nii::Context.new "kw" # => #<Nii::Context:kw-GB>

# Value formatting
nii.format 9.99, style: :currency            # => "£9.99"
nii.format Nii::Territory["GB"]              # => "Rywvaneth Unys"
nii.format ["de", "fr", "it"], as: :language # => "de, fr, it"
```

## Variants

<table>
  <thead>
    <tr>
      <th>Subtag</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>kkcor</code></td>
      <td>Common Cornish orthography of Revived Cornish</td>
    </tr>
    <tr>
      <td><code>kscor</code></td>
      <td>Standard Cornish orthography of Revived Cornish / Kernowek Standard</td>
    </tr>
    <tr>
      <td><code>uccor</code></td>
      <td>Unified Cornish orthography of Revived Cornish</td>
    </tr>
    <tr>
      <td><code>ucrcor</code></td>
      <td>Unified Cornish Revised orthography of Revived Cornish</td>
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
      <td><code>kw-GB</code></td>
      <td>Cornish (United Kingdom)</td>
      <td><code>kw</code> and <code>cor</code></td>
    </tr>
  </tbody>
</table>

