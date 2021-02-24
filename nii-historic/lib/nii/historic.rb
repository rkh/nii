# frozen_string_literal: true
require 'nii/core'
require 'nii/calendars'

module Nii
  module Calendar
    autoload :British,       'nii/calendar/british'
    autoload :Catholic,      'nii/calendar/catholic'
    autoload :Julian,        'nii/calendar/julian'
    autoload :Revolutionary, 'nii/calendar/revolutionary'
  end

  Data::CALENDAR_ALIASES['french-republican'] = 'revolutionary'
  # DATA.load_path << File.expand_path('../../data', __dir__)
end
