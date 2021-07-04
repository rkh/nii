<!-- This file has been generated. Source: languages/_template.md.erb -->

# Manipuri

## Installation

In order to use Manipuri with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Manipuri
nii = Nii::Context.new "mni" # => #<Nii::Context:mni-Beng-IN>

# Value formatting
nii.format 9.99, style: :currency            # => "₹ ৯.৯৯"
nii.format Nii::Territory["IN"]              # => "ইন্দিয়া"
nii.format ["de", "fr", "it"], as: :language # => "জর্মন, ফ্রেঞ্চ অমসুং ইটালিয়ান"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Manipuri</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>নুমাং</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>PM</td>
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
      <td><code>mni-Beng</code></td>
      <td>Manipuri (Bangla)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>mni-Beng-IN</code></td>
      <td>Manipuri (Bangla, India)</td>
      <td><code>mni</code></td>
    </tr>
    <tr>
      <td><code>mni-Mtei</code></td>
      <td>Manipuri (Meitei Mayek)</td>
      <td></td>
    </tr>
  </tbody>
</table>

