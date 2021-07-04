<!-- This file has been generated. Source: languages/_template.md.erb -->

# Javanese

## Installation

You do not need any additional libraries to use Javanese with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Javanese
nii = Nii::Context.new "jv" # => #<Nii::Context:jv-ID>

# Value formatting
nii.format 9.99, style: :currency            # => "Rp 9,99"
nii.format Nii::Territory["ID"]              # => "Indonésia"
nii.format ["de", "fr", "it"], as: :language # => "Jérman, Prancis, lan Italia"
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
      <td><code>jv-ID</code></td>
      <td>Javanese (Indonesia)</td>
      <td><code>jv</code>, <code>jav</code>, and <code>jw</code></td>
    </tr>
  </tbody>
</table>

