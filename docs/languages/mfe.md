<!-- This file has been generated. Source: languages/_template.md.erb -->

# Morisyen

## Installation

In order to use Morisyen with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Morisyen
nii = Nii::Context.new "mfe" # => #<Nii::Context:mfe-MU>

# Value formatting
nii.format 9.99, style: :currency            # => "Rs 9.99"
nii.format Nii::Territory["MU"]              # => "Moris"
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
      <td><code>mfe-MU</code></td>
      <td>Morisyen (Mauritius)</td>
      <td><code>mfe</code></td>
    </tr>
  </tbody>
</table>

