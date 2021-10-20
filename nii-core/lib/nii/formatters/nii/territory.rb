# frozen_string_literal: true

module Nii::Formatters::Nii
  module Territory
    extend self
    # @see Nii::Context#format
    # @option (see Nii::Formatters::String.format_as_territory)
    # @!scope module
    def format(context, value, **options) = context.format(value.code, as: :territory, **options)
  end
end
