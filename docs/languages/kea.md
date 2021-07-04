<!-- This file has been generated. Source: languages/_template.md.erb -->

# Kabuverdianu

## Installation

In order to use Kabuverdianu with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Kabuverdianu
nii = Nii::Context.new "kea" # => #<Nii::Context:kea-CV>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 ​"
nii.format Nii::Territory["CV"]              # => "Kabu Verdi"
nii.format ["de", "fr", "it"], as: :language # => "alemon, franses i italianu"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Kabuverdianu</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>am</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>pm</td>
      <td>12:00 to 24:00</td>
    </tr>
  </tbody>
</table>


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
      <td><code>barla</code></td>
      <td>The Barlavento dialect group of Kabuverdianu</td>
      <td>Barlavento is one of the two main dialect groups of Kabuverdianu.</td>
    </tr>
    <tr>
      <td><code>sotav</code></td>
      <td>The Sotavento dialect group of Kabuverdianu</td>
      <td>Sotavento is one of the two main dialect groups of Kabuverdianu.</td>
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
      <td><code>kea-CV</code></td>
      <td>Kabuverdianu (Cape Verde)</td>
      <td><code>kea</code></td>
    </tr>
  </tbody>
</table>

