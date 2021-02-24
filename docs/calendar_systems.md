# Calendar Systems

## Overview

 Calendar System                         | Gem           | CDLR Identifiers      | Non-CLDR Identifiers | Calendar Type | Conversion Precision  | Arithmetic Precision
-----------------------------------------|---------------|-----------------------|----------------------|---------------|-----------------------|----------------------
 Gregorian Calendar                      | nii-core      | `gregorian`, `gregory`| –                    | Solar         | Exact                 | Exact
 Traditional Chinese Calendar            | nii-calendars | `chinese`             | –                    | Lunisolar     | Exact                 | Exact
 Hebrew/Jewish civil calendar            | nii-calendars | `hebrew`              | –                    | Lunisolar     | Exact / One Day       | Exact
 Islamic calendar                        | nii-calendars | `islamic`             | –                    | Lunar         | Unclear               | One day
 Solar Hijri calendar (Iran/Afghanistan) | nii-calendars | `presian`             | `iranian`, `shamsi`  | Solar         | Exact                 | Exact 
 Calendar of the British Empire          | nii-historic  | –                     | `british`            | Solar         | Exact                 | Exact
 Catholic calendar                       | nii-historic  | –                     | `catholic`           | Solar         | Exact                 | Exact
 Julian calendar (unreformed)            | nii-historic  | –                     | `julian`             | Solar         | Exact                 | Exact
 French Republican Calendar              | nii-historic  | –                     | `french-republican`  | Lunisolar     | Exact                 | Exact

## Explanation

* **CLDR Identifiers** should be understood by all CLDR based implementations, including ICU. This does not mean that these will handle the calendars correctly. Most relevant, both Ruby CLDR and Twitter CLDR can only handle the Gregorian Calendar somewhat correctly (historic dates may use the Julian calendar instead, and not all CLDR date fields are supported).
* **Non-CLDR Identifiers** are available within Nii, but not part of the CLDR.
* **Gem** is the Ruby gem you have to install and load in order for the calendar to be available. You can use `nii` as a meta-gem instead, which will include `nii-core` and `nii-calendars` (but won't include `nii-historic`).
* **Conversion precision** refers to the conversion from/to another calendar system. As dates are mapped to Julian Day Numbers internally, these precision issues
may compound.
* **Arithmetic precision** refers to the calculation of one date based on another date in the same calendar (example: calculating the next day).
