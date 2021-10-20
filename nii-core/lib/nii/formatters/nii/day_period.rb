# frozen_string_literal: true

module Nii::Formatters::Nii
  module DayPeriod
    extend self
    # @see Nii::Context#format
    # @option (see Nii::Formatters::String.format_as_day_period)
    # @!scope module
    def format(context, value, **options) = context.format(value.name, as: :day_period, **options)
  end
end
