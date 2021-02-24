# frozen_string_literal: true

module Nii::Calendar
  # The Julian calendar system.
  class Julian < Gregorian
    private def setup = @reform_jd = ::Date::JULIAN
  end
end
