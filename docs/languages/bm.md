<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

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

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Bambara</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>AM</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>PM</td>
      <td>12:00 to 24:00</td>
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

