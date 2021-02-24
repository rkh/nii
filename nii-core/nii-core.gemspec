require_relative '../tools/lib/nii_gemspec'

NiiGemspec.new 'New I18n Implementation: Core Library', false do |s|
  s.add_runtime_dependency 'concurrent-ruby', '~> 1.1'
  s.add_runtime_dependency 'nii-rbnf', s.version
  s.add_runtime_dependency 'tzinfo', '~> 2.0'
end
