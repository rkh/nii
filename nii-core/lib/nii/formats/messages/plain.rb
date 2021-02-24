# frozen_string_literal: true

module Nii::Formats::Messages
  module Plain
    extend self

    def compile(bundle, source)
      Nii::Template::Element.new(bundle, source)
    end
  end
end
