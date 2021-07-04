<!-- This file has been generated. Source: languages/_template.md.erb -->

# Sinhala

## Installation

You do not need any additional libraries to use Sinhala with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Sinhala
nii = Nii::Context.new "si" # => #<Nii::Context:si-LK>

# Value formatting
nii.format 9.99, style: :currency            # => "රු. 9.99"
nii.format Nii::Territory["LK"]              # => "ශ්‍රී ලංකාව"
nii.format ["de", "fr", "it"], as: :language # => "ජර්මන්, ප්‍රංශ, සහ ඉතාලි"
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
      <td><code>si-LK</code></td>
      <td>Sinhala (Sri Lanka)</td>
      <td><code>si</code> and <code>sin</code></td>
    </tr>
  </tbody>
</table>

