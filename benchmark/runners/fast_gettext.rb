# frozen_string_literal: true
require 'fast_gettext'
FastGettext.add_text_domain('example', path: 'gettext')
FastGettext.available_locales = ['en']
FastGettext.locale            = 'en'
BENCHMARKS[:fast_gettext]     = -> do
  FastGettext.text_domain     = 'example'
  FastGettext._('hello') % { name: 'World' }
end
