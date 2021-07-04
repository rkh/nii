<!-- This file has been generated. Source: languages/_template.md.erb -->

# Kannada

## Installation

You do not need any additional libraries to use Kannada with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Kannada
nii = Nii::Context.new "kn" # => #<Nii::Context:kn-IN>

# Value formatting
nii.format 9.99, style: :currency            # => "₹9.99"
nii.format Nii::Territory["IN"]              # => "ಭಾರತ"
nii.format ["de", "fr", "it"], as: :language # => "ಜರ್ಮನ್, ಫ್ರೆಂಚ್, ಮತ್ತು ಇಟಾಲಿಯನ್"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Kannada</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>ಪೂರ್ವಾಹ್ನ</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>ಅಪರಾಹ್ನ</td>
      <td>12:00 to 24:00</td>
    </tr>
    <tr>
      <td>afternoon1</td>
      <td>afternoon</td>
      <td>ಮಧ್ಯಾಹ್ನ</td>
      <td>12:00 to 18:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>ಸಂಜೆ</td>
      <td>18:00 to 21:00</td>
    </tr>
    <tr>
      <td>midnight</td>
      <td>midnight</td>
      <td>ಮಧ್ಯರಾತ್ರಿ</td>
      <td>at 00:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>ಬೆಳಗ್ಗೆ</td>
      <td>06:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>ರಾತ್ರಿ</td>
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
      <td><code>kn-IN</code></td>
      <td>Kannada (India)</td>
      <td><code>kn</code> and <code>kan</code></td>
    </tr>
  </tbody>
</table>

