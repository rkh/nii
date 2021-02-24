# frozen_string_literal: true

module Nii::Formatters
  module Date
    extend self
    # @see Nii::Context#format
    # @!scope module
    def format(context, value, **options)
      raise NotImplementedError
    end
  end
end
