# frozen_string_literal: true

module Nii::Formats::Messages
  module ARB
    extend self

    def compile(bundle, source)
      raise NotImplementedError
    end
  end
end
