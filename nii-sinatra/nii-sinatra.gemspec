require_relative '../tools/lib/nii_gemspec'
NiiGemspec.new 'Sinatra integration for Nii' do |s|
  s.add_runtime_dependency 'sinatra', '~> 2.0'
end
