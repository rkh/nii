require_relative '../tools/lib/nii_gemspec'

NiiGemspec.new 'Nii support for XML based localization files' do |s|
  s.add_runtime_dependency 'nokogiri', '~> 1.11'
end
