<!-- This file has been generated. Source: languages/_template.md.erb -->

# Zarma

## Installation

In order to use Zarma with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Zarma
nii = Nii::Context.new "dje" # => #<Nii::Context:dje-NE>

# Value formatting
nii.format 9.99, style: :currency            # => "9.99 F CFA"
nii.format Nii::Territory["NE"]              # => "Nižer"
nii.format ["de", "fr", "it"], as: :language # => "Almaŋ senni, Fransee senni, Itaali senni"
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
      <td><code>dje-NE</code></td>
      <td>Zarma (Niger)</td>
      <td><code>dje</code></td>
    </tr>
    <tr>
      <td><code>dje-Arab</code></td>
      <td>Zarma (Arabic)</td>
      <td></td>
    </tr>
  </tbody>
</table>

