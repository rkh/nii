<!-- This file has been generated. Source: languages/_template.md.erb -->

# Urdu

## Installation

You do not need any additional libraries to use Urdu with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Urdu
nii = Nii::Context.new "ur" # => #<Nii::Context:ur-PK>

# Value formatting
nii.format 9.99, style: :currency            # => "Rs 9.99"
nii.format Nii::Territory["PK"]              # => "پاکستان"
nii.format ["de", "fr", "it"], as: :language # => "جرمن، فرانسیسی، اور اطالوی"
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
      <td><code>ur-IN</code></td>
      <td>Urdu (India)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ur-PK</code></td>
      <td>Urdu (Pakistan)</td>
      <td><code>ur</code> and <code>urd</code></td>
    </tr>
  </tbody>
</table>

