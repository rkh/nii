# frozen_string_literal: true
module Nii::Parser
  module Fluent
    class Comment < Generic
      PATTERN = /(?<prefix>\#{1,3})(?: (?<comment>[^\n]*))?(?:\n|\r\n|\z)/
      INVALID_PATTERN = /\s*\#/
      attr_reader :level, :comment

      def parse
        if parser.scan(PATTERN)
          @level   = parser[:prefix].size
          @comment = Nii::Utils.string(parser[:comment])
          true
        elsif parser.check(INVALID_PATTERN)
          parser.hint 'malformatted comment'
        end
      end

      def join?(other)
        other.level == level
      end

      def join(other)
        super
        @comment = "#{comment}\n#{other.comment}"
      end

      def to_sexp
        [:comment, level, comment]
      end

      def compile(*)
      end
    end
  end
end
