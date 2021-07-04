<!-- This file has been generated. Source: languages/_template.md.erb -->

# Latvian

## Installation

You do not need any additional libraries to use Latvian with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Latvian
nii = Nii::Context.new "lv" # => #<Nii::Context:lv-LV>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 €"
nii.format Nii::Territory["LV"]              # => "Latvija"
nii.format ["de", "fr", "it"], as: :language # => "vācu, franču un itāļu"
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
      <td><code>vecdruka</code></td>
      <td>Latvian orthography used before 1920s ("vecā druka")</td>
      <td>The subtag represents the old orthography of the Latvian language used during c. 1600s–1920s.</td>
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
      <td><code>lv-LV</code></td>
      <td>Latvian (Latvia)</td>
      <td><code>lv</code>, <code>lav</code>, and <code>lvs</code></td>
    </tr>
  </tbody>
</table>

