# frozen_string_literal: true
module Nii::Parser
  module Fluent
    class Attribute < MessageEntry
      PREFIX = /[ \r\n]*\./

      def parse
        parser.scan(PREFIX) && super
      end

      def compile(bundle, config)
        pattern.compile(bundle, config)
      end
    end
  end
end
