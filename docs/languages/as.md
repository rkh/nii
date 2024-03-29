<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Assamese

## Installation

You do not need any additional libraries to use Assamese with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Assamese
nii = Nii::Context.new "as" # => #<Nii::Context:as-IN>

# Value formatting
nii.format 9.99, style: :currency            # => "₹ ৯.৯৯"
nii.format Nii::Territory["IN"]              # => "ভাৰত"
nii.format ["de", "fr", "it"], as: :language # => "জাৰ্মান, ফ্ৰেন্স আৰু ইটালিয়ান"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Assamese</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>পূৰ্বাহ্ন</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>অপৰাহ্ন</td>
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
      <td><code>as-IN</code></td>
      <td>Assamese (India)</td>
      <td><code>as</code> and <code>asm</code></td>
    </tr>
  </tbody>
</table>

