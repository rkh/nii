# frozen_string_literal: true
module Nii::Parser
  module Fluent
    class Expression < Generic
      def self.parse!(parser)
        return super unless self == Expression
        parser.any(:string, :number, :function, :reference, :placeable)
      end
    end
  end
end
