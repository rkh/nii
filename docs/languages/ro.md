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

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Romanian</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>a.m.</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>p.m.</td>
      <td>12:00 to 24:00</td>
    </tr>
    <tr>
      <td>afternoon1</td>
      <td>afternoon</td>
      <td>după-amiaza</td>
      <td>12:00 to 18:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>seara</td>
      <td>18:00 to 22:00</td>
    </tr>
    <tr>
      <td>midnight</td>
      <td>midnight</td>
      <td>la miezul nopții</td>
      <td>at 00:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>dimineața</td>
      <td>05:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>noaptea</td>
      <td>22:00 to 05:00</td>
    </tr>
    <tr>
      <td>noon</td>
      <td>noon</td>
      <td>la amiază</td>
      <td>at 12:00</td>
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

