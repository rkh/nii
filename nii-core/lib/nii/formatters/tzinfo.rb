# frozen_string_literal: true

module Nii::Formatters::TZInfo
  module Timestamp
    extend self
    # @see Nii::Context#format
    # @!scope module
    def format(context, value, **options) = context.format(value.to_time, **options)
  end

  module Timezone
    extend self
    # @option (see Nii::Formatters::Nii::Timezone.format)
    # @see Nii::Context#format
    # @!scope module
    def format(context, value, **options) = context.format(context.time.zone(value), **options)
  end

  module Country
    extend self
    # @see Nii::Context#format
    # @!scope module
    def format(context, value, **options) = context.format(value.code, as: :territory, **options)
  end
end
