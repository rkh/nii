require_relative '../lib/nii_gemspec'
NiiGemspec.new 'Internal tool for importing CLDR data' do |s|
  s.add_runtime_dependency 'neatjson', '~> 0.9'
  s.add_runtime_dependency 'progressbar'
  s.add_runtime_dependency 'nokogiri'
end
