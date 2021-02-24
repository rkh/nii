# frozen_string_literal: true

module Nii::Info
  class HE::Text < Text
    ALT_LIST = %r{\A
      (?:\s*<[^>]*>)*       # ignore common markup
      (?![\s\<])\p{^Hebrew} # word starts with something besides a Hebrew letter
    }xmi
    private_constant :ALT_LIST

    def list_pattern(style, element, first = nil, second = nil)
      second =~ ALT_LIST ? super.sub('ו', '-ו') : super
    end
  end
end
