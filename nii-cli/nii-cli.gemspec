require_relative '../tools/lib/nii_gemspec'
NiiGemspec.new 'A Command Line Tool for Nii' do |s|
  s.add_runtime_dependency 'dry-cli', '~> 0.7'
  s.add_runtime_dependency 'nii-xml', s.version
  s.executables << 'nii'
end
