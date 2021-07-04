<!-- This file has been generated. Source: languages/_template.md.erb -->

# Thai

## Installation

You do not need any additional libraries to use Thai with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Thai
nii = Nii::Context.new "th" # => #<Nii::Context:th-TH>

# Value formatting
nii.format 9.99, style: :currency            # => "฿9.99"
nii.format Nii::Territory["TH"]              # => "ไทย"
nii.format ["de", "fr", "it"], as: :language # => "เยอรมัน ฝรั่งเศส และอิตาลี"
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
      <td><code>th-TH</code></td>
      <td>Thai (Thailand)</td>
      <td><code>th</code> and <code>tha</code></td>
    </tr>
  </tbody>
</table>

