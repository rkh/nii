# Getting Started, Part 1: Introduction

Nii's aim is to provide both internationalization and localization for your Ruby application or library.
It comes with simple and advanced APIs to abstract out any language specific logic. Actually, it goes beyond language, to what is referred to as a locale, which can include a whole range of information, like the appropriate region, language variants, and so on. But more on that later.

Features include of course looking up the correct translation for a string. It also handles converting various Ruby objects into localized representations (Numbers, Dates, money, units, but also your own objects), with support for a whole range of scripts, numbering and calendar systems. Nii is also aware of various grammatical aspects languages can bring with them, like how pluralization is done, grammatical cases, grammatical genders, definiteness, how compound words are handled in a language, T–V distinction, writing direction, and so on. Most of this doesn't really matter for English, so it's easy to forget about it when designing an application.

There are tools to perform sorting (yes, sorting is a thing that works differently in various languages), converting between scripts, converting between measurement systems, and so on. Essentially, Nii's aim is to give you the best tools for all the parts in your application's output that might differ based on a user's locale.

To know all this about a locale, Nii is relying heavily on what is called the [Unicode Common Locale Data Repository](http://cldr.unicode.org/). But we're getting ahead of ourselves. Just know that if you want to localize your application, Nii almost certainly already knows how to handle the locale you want to add support for.

## Further Reading
* **Next Chapter: [Part 2: The Context Object](02-context.md)**
* Wikipedia: [Internationalization and localization](https://en.wikipedia.org/wiki/Internationalization_and_localization)
