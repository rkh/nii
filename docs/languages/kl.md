<!-- This file has been generated. Source: languages/_template.md.erb -->

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
```

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

