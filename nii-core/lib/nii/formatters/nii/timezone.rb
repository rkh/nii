# frozen_string_literal: true

module Nii::Formatters::Nii
  module Timezone
    module Meta
      extend self
      # @see Nii::Context#format
      # @!scope module
      def format(context, value, **options)
        raise NotImplementedError
      end
    end

    extend self
    # @see Nii::Context#format
    # @!scope module
    def format(context, value, **options)
      raise NotImplementedError
    end
  end
end
