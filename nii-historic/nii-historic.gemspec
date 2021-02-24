require_relative '../tools/lib/nii_gemspec'

NiiGemspec.new 'Historic data (like history calendars) for Nii' do |s|
  s.add_runtime_dependency 'nii-calendars', s.version
end
