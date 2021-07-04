<!-- This file has been generated. Source: languages/_template.md.erb -->

# German

## Installation

You do not need any additional libraries to use German with Nii.
All language data is included in `nii-core`.

## Example Usage

``` ruby
# Create a context for German
nii = Nii::Context.new "de" # => #<Nii::Context:de-DE>

# Value formatting
nii.format 9.99, style: :currency            # => "9,99 €"
nii.format Nii::Territory["DE"]              # => "Deutschland"
nii.format ["de", "fr", "it"], as: :language # => "Deutsch, Französisch und Italienisch"

# Spelling out numbers
nii.numbers.spellout 1                  # => "eins"
nii.numbers.spellout 115                # => "ein­hundert­fünfzehn"
nii.numbers.spellout 2020, :year        # => "zwei­tausend­zwanzig"
nii.numbers.spellout 1,    :neuter      # => "ein"
nii.numbers.spellout 1,    :masculine   # => "ein"
nii.numbers.spellout 1,    :feminine    # => "eine"
nii.numbers.spellout 1,    :n           # => "einen"
nii.numbers.spellout 1,    :r           # => "einer"
nii.numbers.spellout 1,    :s           # => "eines"
nii.numbers.spellout 1,    :m           # => "einem"
nii.numbers.spellout 1,    :ordinal     # => "erste"
nii.numbers.spellout 115,  :ordinal     # => "ein­hundert­fünfzehnte"
nii.numbers.spellout 1,    :ordinal, :n # => "ersten"
nii.numbers.spellout 115,  :ordinal, :n # => "ein­hundert­fünfzehnten"
nii.numbers.spellout 1,    :ordinal, :r # => "erster"
nii.numbers.spellout 115,  :ordinal, :r # => "ein­hundert­fünfzehnter"
nii.numbers.spellout 1,    :ordinal, :s # => "erstes"
nii.numbers.spellout 115,  :ordinal, :s # => "ein­hundert­fünfzehntes"
nii.numbers.spellout 1,    :ordinal, :m # => "erstem"
nii.numbers.spellout 115,  :ordinal, :m # => "ein­hundert­fünfzehntem"
```

## Variants

<table>
  <thead>
    <tr>
      <th>Subtag</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>1901</code></td>
      <td>Traditional German orthography</td>
    </tr>
    <tr>
      <td><code>1996</code></td>
      <td>German orthography of 1996</td>
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
      <td><code>de-AT</code></td>
      <td>Austrian German</td>
      <td></td>
    </tr>
    <tr>
      <td><code>de-BE</code></td>
      <td>German (Belgium)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>de-CH</code></td>
      <td>Swiss High German</td>
      <td></td>
    </tr>
    <tr>
      <td><code>de-DE</code></td>
      <td>German (Germany)</td>
      <td><code>de</code>, <code>deu</code>, and <code>ger</code></td>
    </tr>
    <tr>
      <td><code>de-IT</code></td>
      <td>German (Italy)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>de-LI</code></td>
      <td>German (Liechtenstein)</td>
      <td></td>
    </tr>
    <tr>
      <td><code>de-LU</code></td>
      <td>German (Luxembourg)</td>
      <td></td>
    </tr>
  </tbody>
</table>
