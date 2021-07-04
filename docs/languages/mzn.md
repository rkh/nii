<!-- This file has been generated. Source: languages/_template.md.erb -->

# Mazanderani

## Installation

In order to use Mazanderani with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Mazanderani
nii = Nii::Context.new "mzn" # => #<Nii::Context:mzn-IR>

# Value formatting
nii.format 9.99, style: :currency            # => "IRR ۹٫۹۹"
nii.format Nii::Territory["IR"]              # => "ایران"
nii.format ["de", "fr", "it"], as: :language # => "آلمانی, فرانسوی, ایتالیایی"
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
      <td><code>mzn-IR</code></td>
      <td>Mazanderani (Iran)</td>
      <td><code>mzn</code></td>
    </tr>
  </tbody>
</table>

