<!-- This file has been generated. Source: languages/_template.md.erb -->

# Malayalam

## Installation

You do not need any additional libraries to use Malayalam with Nii.
However, you do need to install `nii-extra-locales` in order to use Malayalam (Arabic).
See the [list of locales](#locales) below.

## Example Usage

``` ruby
# Create a context for Malayalam
nii = Nii::Context.new "ml" # => #<Nii::Context:ml-IN>

# Value formatting
nii.format 9.99, style: :currency            # => "₹9.99"
nii.format Nii::Territory["IN"]              # => "ഇന്ത്യ"
nii.format ["de", "fr", "it"], as: :language # => "ജർമ്മൻ, ഫ്രഞ്ച്, ഇറ്റാലിയൻ എന്നിവ"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Malayalam</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>AM</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>PM</td>
      <td>12:00 to 24:00</td>
    </tr>
    <tr>
      <td>afternoon1</td>
      <td>afternoon</td>
      <td>ഉച്ചയ്ക്ക്</td>
      <td>12:00 to 14:00</td>
    </tr>
    <tr>
      <td>afternoon2</td>
      <td>afternoon</td>
      <td>ഉച്ചതിരിഞ്ഞ്</td>
      <td>14:00 to 15:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>വൈകുന്നേരം</td>
      <td>15:00 to 18:00</td>
    </tr>
    <tr>
      <td>evening2</td>
      <td>evening</td>
      <td>സന്ധ്യ</td>
      <td>18:00 to 19:00</td>
    </tr>
    <tr>
      <td>midnight</td>
      <td>midnight</td>
      <td>അർദ്ധരാത്രി</td>
      <td>at 00:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>പുലർച്ചെ</td>
      <td>03:00 to 06:00</td>
    </tr>
    <tr>
      <td>morning2</td>
      <td>morning</td>
      <td>രാവിലെ</td>
      <td>06:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>രാത്രി</td>
      <td>19:00 to 03:00</td>
    </tr>
    <tr>
      <td>noon</td>
      <td>noon</td>
      <td>ഉച്ച</td>
      <td>at 12:00</td>
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
      <td><code>ml-Arab</code></td>
      <td><code>nii-extra-locales</code></td>
      <td>Malayalam (Arabic)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>ml-IN</code></td>
      <td><code>nii-core</code></td>
      <td>Malayalam (India)</td>
      <td><code>ml</code> and <code>mal</code></td>
    </tr>
  </tbody>
</table>

