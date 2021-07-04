<!-- This file has been generated. Source: languages/_template.md.erb -->

# Basque

## Installation

You do not need any additional libraries to use Basque with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Basque
nii = Nii::Context.new "eu" # => #<Nii::Context:eu-ES>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 €"
nii.format Nii::Territory["ES"]              # => "Espainia"
nii.format ["de", "fr", "it"], as: :language # => "aleman, frantses eta italiera"
```

## Variants

<table>
  <thead>
    <tr>
      <th>Subtag</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>biscayan</code></td>
      <td>Biscayan dialect of Basque</td>
    </tr>
  </tbody>
</table>

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
      <td><code>eu-ES</code></td>
      <td>Basque (Spain)</td>
      <td><code>eu</code>, <code>baq</code>, and <code>eus</code></td>
    </tr>
  </tbody>
</table>

