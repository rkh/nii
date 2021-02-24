# frozen_string_literal: true
require 'r18n-core'

R18n.default_places ='r18n'

R18n.set('en')
R18n::Filters.on(:global_escape_html)
R18n::Filters.on(:named_variables)

BENCHMARKS[:r18n] = -> { R18n.get.hello(name: 'World').to_s }
