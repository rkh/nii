<!-- This file has been generated. Source: languages/_template.md.erb -->

# Korean

## Installation

You do not need any additional libraries to use Korean with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Korean
nii = Nii::Context.new "ko" # => #<Nii::Context:ko-KR>

# Value formatting
nii.format 9.99, style: :currency            # => "₩9.99"
nii.format Nii::Territory["KR"]              # => "대한민국"
nii.format ["de", "fr", "it"], as: :language # => "독일어, 프랑스어 및 이탈리아어"
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
      <td><code>ko-KP</code></td>
      <td>Korean (North Korea)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ko-KR</code></td>
      <td>Korean (South Korea)</td>
      <td><code>ko</code> and <code>kor</code></td>
    </tr>
  </tbody>
</table>

