require_relative '../tools/lib/nii_gemspec'
NiiGemspec.new 'Rails integration for Nii' do |s|
  s.add_runtime_dependency 'nii-i18n', s.version
  # ...
end
