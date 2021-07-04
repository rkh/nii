<!-- This file has been generated. Source: languages/_template.md.erb -->

# Telugu

## Installation

You do not need any additional libraries to use Telugu with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Telugu
nii = Nii::Context.new "te" # => #<Nii::Context:te-IN>

# Value formatting
nii.format 9.99, style: :currency            # => "₹9.99"
nii.format Nii::Territory["IN"]              # => "భారతదేశం"
nii.format ["de", "fr", "it"], as: :language # => "జర్మన్, ఫ్రెంచ్ మరియు ఇటాలియన్"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Telugu</td>
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
      <td>మధ్యాహ్నం</td>
      <td>12:00 to 18:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>సాయంత్రం</td>
      <td>18:00 to 21:00</td>
    </tr>
    <tr>
      <td>midnight</td>
      <td>midnight</td>
      <td>అర్ధరాత్రి</td>
      <td>at 00:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>ఉదయం</td>
      <td>06:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>రాత్రి</td>
      <td>21:00 to 06:00</td>
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
      <td><code>te-IN</code></td>
      <td>Telugu (India)</td>
      <td><code>te</code> and <code>tel</code></td>
    </tr>
  </tbody>
</table>

