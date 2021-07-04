<!-- This file has been generated. Source: languages/_template.md.erb -->

# Bulgarian

## Installation

You do not need any additional libraries to use Bulgarian with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Bulgarian
nii = Nii::Context.new "bg" # => #<Nii::Context:bg-BG>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 лв."
nii.format Nii::Territory["BG"]              # => "България"
nii.format ["de", "fr", "it"], as: :language # => "немски, френски и италиански"
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
      <td><code>ivanchov</code></td>
      <td>Bulgarian in 1899 orthography</td>
      <td>Bulgarian orthography introduced by Todor Ivanchov in 1899</td>
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
      <td><code>bg-BG</code></td>
      <td>Bulgarian (Bulgaria)</td>
      <td><code>bg</code> and <code>bul</code></td>
    </tr>
  </tbody>
</table>

