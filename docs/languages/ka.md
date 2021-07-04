<!-- This file has been generated. Source: languages/_template.md.erb -->

# Georgian

## Installation

You do not need any additional libraries to use Georgian with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for Georgian
nii = Nii::Context.new "ka" # => #<Nii::Context:ka-GE>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 ₾"
nii.format Nii::Territory["GE"]              # => "საქართველო"
nii.format ["de", "fr", "it"], as: :language # => "გერმანული, ფრანგული და იტალიური"

# Spelling out numbers
nii.numbers.spellout 115         # => "ას­თხუთმეტი"
nii.numbers.spellout 1           # => "ერთი"
nii.numbers.spellout 2020, :year # => "ორი ათას ოცი"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Georgian</td>
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
      <td>ნაშუადღევი</td>
      <td>12:00 to 18:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>საღამო</td>
      <td>18:00 to 21:00</td>
    </tr>
    <tr>
      <td>midnight</td>
      <td>midnight</td>
      <td>შუაღამე</td>
      <td>at 00:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>დილა</td>
      <td>05:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>ღამე</td>
      <td>21:00 to 05:00</td>
    </tr>
    <tr>
      <td>noon</td>
      <td>noon</td>
      <td>შუადღე</td>
      <td>at 12:00</td>
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
      <td><code>ka-GE</code></td>
      <td>Georgian (Georgia)</td>
      <td><code>ka</code>, <code>geo</code>, and <code>kat</code></td>
    </tr>
  </tbody>
</table>

