<!-- This file has been generated. Source: languages/_template.md.erb -->

# Tasawaq

## Installation

In order to use Tasawaq with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Tasawaq
nii = Nii::Context.new "twq" # => #<Nii::Context:twq-NE>

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
      <td><code>twq-NE</code></td>
      <td>Tasawaq (Niger)</td>
      <td><code>twq</code></td>
    </tr>
  </tbody>
</table>

