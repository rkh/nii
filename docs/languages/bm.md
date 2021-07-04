<!-- This file has been generated. Source: languages/_template.md.erb -->

# Bambara

## Installation

In order to use Bambara with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Bambara
nii = Nii::Context.new "bm" # => #<Nii::Context:bm-ML>

# Value formatting
nii.format 9.99, style: :currency            # => "F CFA 9.99"
nii.format Nii::Territory["ML"]              # => "Mali"
nii.format ["de", "fr", "it"], as: :language # => "alimaɲikan, tubabukan, italikan"
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
      <td><code>bm-ML</code></td>
      <td>Bambara (Mali)</td>
      <td><code>bm</code> and <code>bam</code></td>
    </tr>
    <tr>
      <td><code>bm-Nkoo</code></td>
      <td>Bambara (N’Ko)</td>
      <td></td>
    </tr>
  </tbody>
</table>

