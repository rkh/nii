<!-- This file has been generated. Source: languages/_template.md.erb -->

# Malay

## Installation

You do not need any additional libraries to use Malay with Nii.
However, you do need to install `nii-extra-locales` in order to use Malay (Arabic).
See the [list of locales](#locales) below.

## Example Usage

``` ruby
# Create a context for Malay
nii = Nii::Context.new "ms" # => #<Nii::Context:ms-MY>

# Value formatting
nii.format 9.99, style: :currency            # => "RM 9.99"
nii.format Nii::Territory["MY"]              # => "Malaysia"
nii.format ["de", "fr", "it"], as: :language # => "Jerman, Perancis dan Itali"

# Spelling out numbers
nii.numbers.spellout 115            # => "seratus lima belas"
nii.numbers.spellout 1              # => "satu"
nii.numbers.spellout 2020, :year    # => "dua ribu dua puluh"
nii.numbers.spellout 115,  :ordinal # => "keseratus lima belas"
```


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
      <td><code>ms-Arab</code></td>
      <td><code>nii-extra-locales</code></td>
      <td>Malay (Arabic)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ms-BN</code></td>
      <td><code>nii-core</code></td>
      <td>Malay (Brunei)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ms-ID</code></td>
      <td><code>nii-core</code></td>
      <td>Malay (Indonesia)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ms-MY</code></td>
      <td><code>nii-core</code></td>
      <td>Malay (Malaysia)</td>
      <td><code>ms</code>, <code>may</code>, <code>msa</code>, and <code>zsm</code></td>
    </tr>
    <tr>
      <td><code>ms-SG</code></td>
      <td><code>nii-core</code></td>
      <td>Malay (Singapore)</td>
      <td></td>
    </tr>
  </tbody>
</table>

