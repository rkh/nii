# frozen_string_literal: true

module Nii::Parser
  module Number
    extend self

    def parse(source)
      return source if source.is_a? Numeric
      value   = Rational(Nii::Utils.string(source))
      integer = value.to_i
      integer == value ? integer : value
    end
  end
end
