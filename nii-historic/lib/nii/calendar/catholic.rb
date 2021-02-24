# frozen_string_literal: true

module Nii::Calendar
  # Calendar accounting for the Catholic switch from the Julian to the Gregorian calendar system.
  # This corresponds to Ruby's default behavior.
  class Catholic < Gregorian
    private def setup = @reform_jd = ::Date::ITALY
  end
end
