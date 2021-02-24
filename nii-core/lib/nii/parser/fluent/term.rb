# frozen_string_literal: true
module Nii::Parser
  module Fluent
    class Term < Message
      def message_type
        :term
      end

      def parse
        parser.scan('-') && super
      end
    end
  end
end
