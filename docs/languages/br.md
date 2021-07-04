<!-- This file has been generated. Source: languages/_template.md.erb -->

# Breton

## Installation

In order to use Breton with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Breton
nii = Nii::Context.new "br" # => #<Nii::Context:br-FR>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 €"
nii.format Nii::Territory["FR"]              # => "Frañs"
nii.format ["de", "fr", "it"], as: :language # => "alamaneg, galleg ha italianeg"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Breton</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>A.M.</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>G.M.</td>
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
      <td><code>br-FR</code></td>
      <td>Breton (France)</td>
      <td><code>br</code> and <code>bre</code></td>
    </tr>
  </tbody>
</table>

