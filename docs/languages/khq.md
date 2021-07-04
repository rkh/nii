<!-- This file has been generated. Source: languages/_template.md.erb -->

# Koyra Chiini

## Installation

In order to use Koyra Chiini with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Koyra Chiini
nii = Nii::Context.new "khq" # => #<Nii::Context:khq-ML>

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
      <td>Name in Koyra Chiini</td>
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
      <td><code>khq-ML</code></td>
      <td>Koyra Chiini (Mali)</td>
      <td><code>khq</code></td>
    </tr>
  </tbody>
</table>

