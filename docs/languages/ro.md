<!-- This file has been generated. Source: languages/_template.md.erb -->

# Romanian

## Installation

You do not need any additional libraries to use Romanian with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Romanian
nii = Nii::Context.new "ro" # => #<Nii::Context:ro-RO>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 RON"
nii.format Nii::Territory["RO"]              # => "România"
nii.format ["de", "fr", "it"], as: :language # => "germană, franceză și italiană"

# Spelling out numbers
nii.numbers.spellout 115             # => "una sută cincisprezece"
nii.numbers.spellout 1               # => "unu"
nii.numbers.spellout 2020, :year     # => "două mii douăzeci"
nii.numbers.spellout 1,    :feminine # => "una"
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
      <td><code>ro-MD</code></td>
      <td>Moldavian</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ro-RO</code></td>
      <td>Romanian (Romania)</td>
      <td><code>ro</code>, <code>mo</code>, <code>mol</code>, <code>ron</code>, and <code>rum</code></td>
    </tr>
  </tbody>
</table>

