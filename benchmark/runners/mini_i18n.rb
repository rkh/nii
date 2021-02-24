# frozen_string_literal: true
require 'mini_i18n'

MiniI18n.load_translations('i18n/en/example.yml')
MiniI18n.default_locale = :en

BENCHMARKS[:mini_i18n] = -> { MiniI18n.t 'hello', name: 'World' }
