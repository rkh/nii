# frozen_string_literal: true

module Nii::Formatters
  module Time
    extend self

    # @see Nii::Context#format
    # @!scope module
    def format(context, value, **options)
      value.to_s # todo
    end
  end
end
