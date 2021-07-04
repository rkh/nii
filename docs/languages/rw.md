<!-- This file has been generated. Source: languages/_template.md.erb -->

# Kinyarwanda

## Installation

In order to use Kinyarwanda with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Kinyarwanda
nii = Nii::Context.new "rw" # => #<Nii::Context:rw-RW>

# Value formatting
nii.format 9.99, style: :currency            # => "RF 9,99"
nii.format Nii::Territory["RW"]              # => "U Rwanda"
nii.format ["de", "fr", "it"], as: :language # => "Ikidage, Igifaransa, Igitaliyani"
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
      <td><code>rw-RW</code></td>
      <td>Kinyarwanda (Rwanda)</td>
      <td><code>rw</code> and <code>kin</code></td>
    </tr>
  </tbody>
</table>

