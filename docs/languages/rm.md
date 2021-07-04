<!-- This file has been generated. Source: languages/_template.md.erb -->

# Romansh

## Installation

In order to use Romansh with Nii, you need to install `nii-extra-locales`.

## Example Usage

``` ruby
# Create a context for Romansh
nii = Nii::Context.new "rm" # => #<Nii::Context:rm-CH>

# Value formatting
nii.format 9.99, style: :currency            # => "9.99 CHF"
nii.format Nii::Territory["CH"]              # => "Svizra"
nii.format ["de", "fr", "it"], as: :language # => "tudestg, franzos e talian"
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
      <td><code>jauer</code></td>
      <td>Jauer dialect of Romansh</td>
      <td>The spoken dialect of the Val Müstair, which has no written standard.</td>
    </tr>
    <tr>
      <td><code>puter</code></td>
      <td>Puter idiom of Romansh</td>
      <td>Puter is one of the five traditional written standards or "idioms" of the Romansh language.</td>
    </tr>
    <tr>
      <td><code>rumgr</code></td>
      <td>Rumantsch Grischun</td>
      <td>Supraregional Romansh written standard</td>
    </tr>
    <tr>
      <td><code>surmiran</code></td>
      <td>Surmiran idiom of Romansh</td>
      <td>Surmiran is one of the five traditional written standards or "idioms" of the Romansh language.</td>
    </tr>
    <tr>
      <td><code>sursilv</code></td>
      <td>Sursilvan idiom of Romansh</td>
      <td>Sursilvan is one of the five traditional written standards or "idioms" of the Romansh language.</td>
    </tr>
    <tr>
      <td><code>sutsilv</code></td>
      <td>Sutsilvan idiom of Romansh</td>
      <td>Sutsilvan is one of the five traditional written standards or "idioms" of the Romansh language.</td>
    </tr>
    <tr>
      <td><code>vallader</code></td>
      <td>Vallader idiom of Romansh</td>
      <td>Vallader is one of the five traditional written standards or "idioms" of the Romansh language.</td>
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
      <td><code>rm-CH</code></td>
      <td>Romansh (Switzerland)</td>
      <td><code>rm</code> and <code>roh</code></td>
    </tr>
  </tbody>
</table>

