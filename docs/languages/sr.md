<!-- This file has been generated. Source: languages/_template.md.erb -->

# Serbian

## Installation

You do not need any additional libraries to use Serbian with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Serbian
nii = Nii::Context.new "sr" # => #<Nii::Context:sr-Latn-RS>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 RSD"
nii.format Nii::Territory["RS"]              # => "Srbija"
nii.format ["de", "fr", "it"], as: :language # => "nemački, francuski i italijanski"
```

## Variants

<table>
  <thead>
    <tr>
      <th>Subtag</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>ekavsk</code></td>
      <td>Serbian with Ekavian pronunciation</td>
    </tr>
    <tr>
      <td><code>ijekavsk</code></td>
      <td>Serbian with Ijekavian pronunciation</td>
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
      <td><code>sr-Cyrl</code></td>
      <td>Serbian (Cyrillic)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>sr-Cyrl-BA</code></td>
      <td>Serbian (Cyrillic, Bosnia &amp; Herzegovina)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>sr-Cyrl-ME</code></td>
      <td>Montenegrin (Cyrillic)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>sr-Cyrl-RS</code></td>
      <td>Serbian (Cyrillic, Serbia)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>sr-Cyrl-XK</code></td>
      <td>Serbian (Cyrillic, Kosovo)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>sr-Latn</code></td>
      <td>Serbian (Latin)</td>
      <td><code>hbs</code> and <code>sh</code></td>
    </tr>
    <tr>
      <td><code>sr-Latn-BA</code></td>
      <td>Serbian (Latin, Bosnia &amp; Herzegovina)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>sr-Latn-ME</code></td>
      <td>Montenegrin (Latin)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>sr-Latn-RS</code></td>
      <td>Serbian (Latin, Serbia)</td>
      <td><code>sr</code>, <code>scc</code>, and <code>srp</code></td>
    </tr>
    <tr>
      <td><code>sr-Latn-XK</code></td>
      <td>Serbian (Latin, Kosovo)</td>
      <td></td>
    </tr>
  </tbody>
</table>

