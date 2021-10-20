# frozen_string_literal: true

module Nii::Formatters
  module Tod
    module Shift
      extend self
      # @see Nii::Context#format
      # @!scope module
      def format(context, value, **options)
        raise NotImplementedError
      end
    end

    module TimeOfDay
      extend self
      # @see Nii::Context#format
      # @!scope module
      def format(context, value, **options)
        raise NotImplementedError
      end
    end
  end
end
