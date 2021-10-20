# frozen_string_literal: true

module Nii::Formatters
  module Date
    extend self

    # @see Nii::Context#format
    #
    # @param context [Nii::Context]
    #   Localization context to use for formatting.
    #
    # @param value [::Date]
    #   Date to format.
    #
    # @option options [String, Symbol, Nii::Calendar::Generic]
    #   calendar to use (example values: +gregorian+, +chinese+).
    #   If not set, {Nii::Context#calendar context.calendar} is used, which in most cases is +gregorian+.
    #
    # @option (see Nii::Context::Formatters::Nii::Date#format)
    #
    # @!scope module
    def format(context, value, calendar: nil, **options)
      date = ::Nii::Date.new(calendar || context.calendar, value)
      context.format(date, **options)
    end
  end
end
