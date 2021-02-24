# frozen_string_literal: true

module Nii::Calendar
  # Calendar of the British Empire and its colonies (this includes British parts of the US).
  class British < Gregorian
    private def setup = @reform_jd = ::Date::ENGLAND
  end
end
