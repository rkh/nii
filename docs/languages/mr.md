<!-- This file has been generated. Source: languages/_template.md.erb -->

# Marathi

## Installation

You do not need any additional libraries to use Marathi with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Marathi
nii = Nii::Context.new "mr" # => #<Nii::Context:mr-IN>

# Value formatting
nii.format 9.99, style: :currency            # => "₹९.९९"
nii.format Nii::Territory["IN"]              # => "भारत"
nii.format ["de", "fr", "it"], as: :language # => "जर्मन, फ्रेंच आणि इटालियन"
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
      <td><code>mr-IN</code></td>
      <td>Marathi (India)</td>
      <td><code>mr</code> and <code>mar</code></td>
    </tr>
  </tbody>
</table>

