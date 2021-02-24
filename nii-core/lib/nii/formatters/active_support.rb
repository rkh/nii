# frozen_string_literal: true

module Nii::Formatters::ActiveSupport
  module Duration
    extend self

    # @see Nii::Context#format
    # @!scope module
    def format(context, value, **options)
      raise NotImplementedError
    end
  end

  module TimeWithZone
    extend self
    # @see Nii::Context#format
    # @!scope module
    def format(context, value, **options)
      # todo handle time zone
      Nii::Formatters::Time.format(context, value, **options)
    end
  end

  module TimeZone
    extend self
    # @option (see Nii::Formatters::Nii::Timezone.format)
    # @see Nii::Context#format
    # @!scope module
    def format(context, value, **options) = context.format(context.time.zone(value), **options)
  end
end
