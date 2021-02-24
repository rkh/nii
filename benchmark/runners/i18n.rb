# frozen_string_literal: true
# enable common features comparable to Nii, but also be fair and enable memoization
require 'i18n'

I18n::Backend::Simple.include I18n::Backend::Fallbacks, I18n::Backend::Metadata, I18n::Backend::Pluralization, I18n::Backend::Memoize
I18n.load_path    = ['i18n/en/example.yml']
BENCHMARKS[:i18n] = -> { I18n.t 'hello', name: 'World' }

