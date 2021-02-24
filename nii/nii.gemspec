require_relative '../tools/lib/nii_gemspec'

NiiGemspec.new 'New I18n Implementation' do |s|
  s.add_runtime_dependency 'nii-units',     s.version
  s.add_runtime_dependency 'nii-calendars', s.version
  s.add_runtime_dependency 'nii-xml',       s.version
end
