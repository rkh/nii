<!-- This file has been generated. Source: languages/_template.md.erb -->

# Kashmiri

## Installation

In order to use Kashmiri with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Kashmiri
nii = Nii::Context.new "ks" # => #<Nii::Context:ks-Arab-IN>

# Value formatting
nii.format 9.99, style: :currency            # => "₹ ۹٫۹۹"
nii.format Nii::Territory["IN"]              # => "ہِندوستان"
nii.format ["de", "fr", "it"], as: :language # => "جٔرمَن, فرینچ, اِٹیلیَن"
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
      <td><code>ks-Arab</code></td>
      <td>Kashmiri (Arabic)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ks-Arab-IN</code></td>
      <td>Kashmiri (Arabic, India)</td>
      <td><code>ks</code> and <code>kas</code></td>
    </tr>
    <tr>
      <td><code>ks-Deva</code></td>
      <td>Kashmiri (Devanagari)</td>
      <td></td>
    </tr>
  </tbody>
</table>

