<!-- This file has been generated. Source: languages/_template.md.erb -->

# Koyraboro Senni

## Installation

In order to use Koyraboro Senni with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Koyraboro Senni
nii = Nii::Context.new "ses" # => #<Nii::Context:ses-ML>

# Value formatting
nii.format 9.99, style: :currency            # => "9.99 F CFA"
nii.format Nii::Territory["ML"]              # => "Maali"
nii.format ["de", "fr", "it"], as: :language # => "Almaŋ senni, Fransee senni, Itaali senni"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Koyraboro Senni</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>Adduha</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>Aluula</td>
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
      <td><code>ses-ML</code></td>
      <td>Koyraboro Senni (Mali)</td>
      <td><code>ses</code></td>
    </tr>
  </tbody>
</table>

