<!-- This file has been generated. Source: languages/_template.md.erb -->

# Mongolian

## Installation

You do not need any additional libraries to use Mongolian with Nii.
However, you do need to install `nii-extra-locales` in order to use Mongolian (Mongolian).
See the [list of locales](#locales) below.

## Example Usage

``` ruby
# Create a context for Mongolian
nii = Nii::Context.new "mn" # => #<Nii::Context:mn-MN>

# Value formatting
nii.format 9.99, style: :currency            # => "₮ 9.99"
nii.format Nii::Territory["MN"]              # => "Монгол"
nii.format ["de", "fr", "it"], as: :language # => "герман, франц, итали"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Mongolian</td>
      <td>Time of Day</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>am</td>
      <td>am</td>
      <td>ү.ө.</td>
      <td>00:00 to 12:00</td>
    </tr>
    <tr>
      <td>pm</td>
      <td>pm</td>
      <td>ү.х.</td>
      <td>12:00 to 24:00</td>
    </tr>
    <tr>
      <td>afternoon1</td>
      <td>afternoon</td>
      <td>өдөр</td>
      <td>12:00 to 18:00</td>
    </tr>
    <tr>
      <td>evening1</td>
      <td>evening</td>
      <td>орой</td>
      <td>18:00 to 21:00</td>
    </tr>
    <tr>
      <td>midnight</td>
      <td>midnight</td>
      <td>шөнө дунд</td>
      <td>at 00:00</td>
    </tr>
    <tr>
      <td>morning1</td>
      <td>morning</td>
      <td>өглөө</td>
      <td>06:00 to 12:00</td>
    </tr>
    <tr>
      <td>night1</td>
      <td>night</td>
      <td>шөнө</td>
      <td>21:00 to 06:00</td>
    </tr>
    <tr>
      <td>noon</td>
      <td>noon</td>
      <td>үд дунд</td>
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
      <td><code>mn-MN</code></td>
      <td><code>nii-core</code></td>
      <td>Mongolian (Mongolia)</td>
      <td><code>mn</code>, <code>drh</code>, <code>khk</code>, and <code>mon</code></td>
    </tr>
    <tr>
      <td><code>mn-Mong</code></td>
      <td><code>nii-extra-locales</code></td>
      <td>Mongolian (Mongolian)</td>
      <td></td>
    </tr>
  </tbody>
</table>

