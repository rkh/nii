# frozen_string_literal: true
require 'gettext'
GetText.bindtextdomain 'example', path: 'gettext'
GetText.locale       = 'en'
BENCHMARKS[:gettext] = -> { GetText.gettext('hello') % { name: 'World' } }
