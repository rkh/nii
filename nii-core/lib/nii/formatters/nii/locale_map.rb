# frozen_string_literal: true

module Nii::Formatters::Nii
  module LocaleMap
    extend self

    # @see Nii::Context#format
    # @!scope module
    def format(context, value, **options) = context.format(value.localize(context, **options))
  end
end
