# frozen_string_literal: true
require 'nii/core'

module Nii
  autoload :Astro, 'nii/astro'

  module Calendar
    autoload :Chinese, 'nii/calendar/chinese'
    autoload :Hebrew,  'nii/calendar/hebrew'
    autoload :Islamic, 'nii/calendar/islamic'
    autoload :Persian, 'nii/calendar/persian'
  end

  # @api internal
  module Calendars
    autoload :LocationHelpers, 'nii/calendars/location_helpers'
  end

  Data::CALENDAR_ALIASES['islamicc'] = 'islamic-civil'
  Data::CALENDAR_ALIASES['ethioaa']  = 'ethiopic-amete-alem'
  Data::CALENDAR_ALIASES['iranian']  = 'persian'
  Data::CALENDAR_ALIASES['shamsi']   = 'persian'
  DATA.load_path << File.expand_path('../../data', __dir__)
end
