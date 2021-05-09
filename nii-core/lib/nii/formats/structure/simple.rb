# frozen_string_literal: true

module Nii::Formats::Structure
  module Simple
    ACCEPTED_VALUES = [String, Numeric, Time, Date, DateTime]
    extend self

    def process(content, **)
      content.each_pair do |key, value|
        raise Nii::Errors::CompileError, "cannot process #{value.class} value" unless ACCEPTED_VALUES.any? { |c| value.is_a? c }
        yield key, value
      end
    end
  end
end
