<!-- This file has been generated. Source: languages/_template.md.erb -->

# Tigrinya

## Installation

In order to use Tigrinya with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Tigrinya
nii = Nii::Context.new "ti" # => #<Nii::Context:ti-ET>

# Value formatting
nii.format 9.99, style: :currency            # => "Br 9.99"
nii.format Nii::Territory["ET"]              # => "ኢትዮጵያ"
nii.format ["de", "fr", "it"], as: :language # => "ጀርመን, ፈረንሳይን, ጥልያን"
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
      <td><code>ti-ER</code></td>
      <td>Tigrinya (Eritrea)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ti-ET</code></td>
      <td>Tigrinya (Ethiopia)</td>
      <td><code>ti</code> and <code>tir</code></td>
    </tr>
  </tbody>
</table>

