require_relative '../tools/lib/nii_gemspec'
NiiGemspec.new 'Use Nii as a backend for I18n' do |s|
  s.add_runtime_dependency 'i18n', '~> 1.8'
end
