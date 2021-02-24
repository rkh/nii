# frozen_string_literal: true

module Nii::Info
  class ES::Text < Text
    ALT_LIST = %r{\A
      (?:\s*<[^>]*>)*  # ignore common markup
      (?:i|hi(?![ea])) # words that start with i or hi, but not hie or hia
    }xmi
    private_constant :ALT_LIST

    def list_pattern(style, element, first = nil, second = nil)
      second =~ ALT_LIST ? super.sub(' y ', ' e ') : super
    end
  end
end
