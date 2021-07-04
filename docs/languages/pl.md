<!-- This file has been generated. Source: languages/_template.md.erb -->

# Polish

## Installation

You do not need any additional libraries to use Polish with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Polish
nii = Nii::Context.new "pl" # => #<Nii::Context:pl-PL>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 zł"
nii.format Nii::Territory["PL"]              # => "Polska"
nii.format ["de", "fr", "it"], as: :language # => "niemiecki, francuski i włoski"
```

## Variants

<table>
  <thead>
    <tr>
      <th>Subtag</th>
      <th>Description</th>
      <th>Comments</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>kociewie</code></td>
      <td>The Kociewie dialect of Polish</td>
      <td>The dialect of Kociewie is spoken in the region around Starogard Gdański, Tczew and Świecie in northern Poland.</td>
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
      <td><code>pl-PL</code></td>
      <td>Polish (Poland)</td>
      <td><code>pl</code> and <code>pol</code></td>
    </tr>
  </tbody>
</table>

