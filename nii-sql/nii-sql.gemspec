require_relative '../tools/lib/nii_gemspec'
NiiGemspec.new 'Load translations from a database' do |s|
  s.add_runtime_dependency 'sequel'
end
