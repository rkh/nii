<!-- This file has been generated. Source: src/docs/languages/_template.md.erb -->

# Kalaallisut

## Installation

In order to use Kalaallisut with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Kalaallisut
nii = Nii::Context.new "kl" # => #<Nii::Context:kl-GL>

# Value formatting
nii.format 9.99, style: :currency            # => "kr. 9,99"
nii.format Nii::Territory["GL"]              # => "Kalaallit Nunaat"
nii.format ["de", "fr", "it"], as: :language # => "de, fr, it"

# Spelling out numbers
nii.spellout 115               # => "uutritit aqqaneq-tallimat"
nii.spellout 1                 # => "ataaseq"
nii.spellout 2020, rule: :year # => "marlunnik tuusintillit marlunnik qulillit"

# With RubyMoney
price = Money.eur 15_00
nii.format   price # => "€15,00"
nii.spellout price # => "aqqaneq-tallimat euro"
```

## Day Periods


<table>
  <thead>
    <tr>
      <td>Period</td>
      <td>Category</td>
      <td>Name in Kalaallisut</td>
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
  </tbody>
</table>


## Variants

<table>
  <thead>
    <tr>
      <th>Subtag</th>
      <th>Description</th>
      <th>Comments</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>tunumiit</code></td>
      <td>Tunumiisiut / East Greenlandic / Østgrønlandsk</td>
      <td>Also known as Tunumiit oraasiat</td>
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
      <td><code>kl-GL</code></td>
      <td>Kalaallisut (Greenland)</td>
      <td><code>kl</code> and <code>kal</code></td>
    </tr>
  </tbody>
</table>

