<!-- This file has been generated. Source: languages/_template.md.erb -->

# Jola-Fonyi

## Installation

In order to use Jola-Fonyi with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Jola-Fonyi
nii = Nii::Context.new "dyo" # => #<Nii::Context:dyo-SN>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 F CFA"
nii.format Nii::Territory["SN"]              # => "Senegal"
nii.format ["de", "fr", "it"], as: :language # => "alman, franse, italien"
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
      <td><code>dyo-SN</code></td>
      <td>Jola-Fonyi (Senegal)</td>
      <td><code>dyo</code></td>
    </tr>
    <tr>
      <td><code>dyo-Arab</code></td>
      <td>Jola-Fonyi (Arabic)</td>
      <td></td>
    </tr>
  </tbody>
</table>

