# frozen_string_literal: true

module Nii::Template
  class TermReference < MessageReference
    def value(context, variables = nil)
      bundle.find(name, type: :term)
    end
  end
end
