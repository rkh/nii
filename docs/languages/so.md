<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Somali

## Installation

You do not need any additional libraries to use Somali with Nii.
However, you do need to install `nii-extra-locales` in order to use Somali (Arabic).
See the [list of locales](#locales) below.

## Example Usage

``` ruby
# Create a context for Somali
nii = Nii::Context.new "so" # => #<Nii::Context:so-SO>

# Value formatting
nii.format 9.99, style: :currency            # => "S 9.99"
nii.format Nii::Territory["SO"]              # => "Soomaaliya"
nii.format ["de", "fr", "it"], as: :language # => "Jarmal, Faransiis iyo Talyaani"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Somali</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>GH</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>GD</td>
      <td>12:00 to 24:00</td>
    </tr>
  </tbody>
</table>



## Locales

<table>
  <thead>
    <tr>
      <th>Locale Tag</th>
      <th>Library</th>
      <th>Description</th>
      <th>Aliases</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>so-Arab</code></td>
      <td><code>nii-extra-locales</code></td>
      <td>Somali (Arabic)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>so-DJ</code></td>
      <td><code>nii-core</code></td>
      <td>Somali (Djibouti)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>so-ET</code></td>
      <td><code>nii-core</code></td>
      <td>Somali (Ethiopia)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>so-KE</code></td>
      <td><code>nii-core</code></td>
      <td>Somali (Kenya)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>so-SO</code></td>
      <td><code>nii-core</code></td>
      <td>Somali (Somalia)</td>
      <td><code>so</code> and <code>som</code></td>
    </tr>
  </tbody>
</table>

