require_relative '../tools/lib/nii_gemspec'
NiiGemspec.new 'Use Nii for formatting and translating Slim templates' do |s|
  s.add_runtime_dependency 'slim', '~> 4.1'
end
