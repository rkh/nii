# frozen_string_literal: true

module Nii
  MAIN_GEMS       = %w[ nii-core nii-calendars nii-units nii-xml ]
  ADDITIONAL_GEMS = %w[ nii-extra-locales nii-global nii-historic nii-i18n nii-sinatra ]
  private_constant :MAIN_GEMS, :ADDITIONAL_GEMS

  MAIN_GEMS.each { |gem| require gem }
  ADDITIONAL_GEMS.each do |gem|
    require gem
  rescue LoadError => error
    raise error unless error.path == gem
  end
end
