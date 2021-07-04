<!-- This file has been generated. Source: languages/_template.md.erb -->

# Masai

## Installation

In order to use Masai with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Masai
nii = Nii::Context.new "mas" # => #<Nii::Context:mas-KE>

# Value formatting
nii.format 9.99, style: :currency            # => "Ksh 9.99"
nii.format Nii::Territory["KE"]              # => "Kenya"
nii.format ["de", "fr", "it"], as: :language # => "nkʉtʉ́k ɔ́ɔ̄ ljerumani, nkʉtʉ́k ɔ́ɔ̄ faransa, nkʉtʉ́k ɔ́ɔ̄ ltalian"
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
      <td><code>mas-KE</code></td>
      <td>Masai (Kenya)</td>
      <td><code>mas</code></td>
    </tr>
    <tr>
      <td><code>mas-TZ</code></td>
      <td>Masai (Tanzania)</td>
      <td></td>
    </tr>
  </tbody>
</table>

