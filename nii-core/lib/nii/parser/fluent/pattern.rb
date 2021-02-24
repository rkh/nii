# frozen_string_literal: true
module Nii::Parser
  module Fluent
    class Pattern < Generic
      LINE_END    = /\r\n|\r|\n|\z/
      EMPTY_LINE  = / *(?:\r\n|\n)/
      INDENTATION = /#{EMPTY_LINE}* +[^ \r\n\.\*\[\}]/

      def parse
        return false unless first_line = parse_line(false)
        lines           = []
        max_indentation = nil

        while parser.check(INDENTATION)
          return false unless line = parse_line

          if line.first.respond_to? :max_indentation
            max = line.first.max_indentation
            max_indentation = max unless max_indentation and max_indentation < max
          end

          lines << line
        end

        first_line.each { |element| self << element }

        lines.each do |line|
          line.first.indentation = max_indentation if max_indentation and line.first.respond_to? :indentation=
          line.each { |element| self << element }
        end

        children.last.rstrip if children.last.respond_to? :rstrip

        true
      end

      def parse_line(include_empty = true)
        if include_empty and empty = parser.parse(:text, pattern: EMPTY_LINE, max_indentation: 100)
          return [empty]
        end

        elements = []

        while element = parser.any(:text, :placeable)
          elements << element
        end

        if parser.scan(LINE_END)
          elements
        else
          parser.hint('unmatched closing brace') if parser.peek(1) == '}'
        end
      end

      def compile(bundle, config)
        Nii::Template::Concat.new(bundle, children.map { |node| node.compile(bundle, config) })
      end
    end
  end
end
