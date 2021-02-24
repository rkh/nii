# frozen_string_literal: true
module Nii::Parser
  module Fluent
    class String < Text
      def parse
        return unless parser.scan('"')
        @value = ::String.new

        until parser.eos?
          case char = parser.getch
          when "\n", "\r", nil then return parser.hint('unmatched quotation mark')
          when '"'             then return true
          when "\\"
            case escaped = parser.getch
            when '"', "\\" then @value << escaped
            when 'u'       then @value << (unicode(parser.scan(/[0-9a-fA-F]{4}/)) || return)
            when 'U'       then @value << (unicode(parser.scan(/[0-9a-fA-F]{6}/)) || return)
            else return parser.hint("invalid escape sequence \\#{escaped}")
            end
          else
            @value << char
          end
        end

        parser.hint('unmatched quotation mark')
      end

      def ignore?
        false
      end

      def unicode(value)
        value.hex.chr('UTF-8') if value
      rescue RangeError
        [value.hex].pack('C*').force_encoding('UTF-8')
      end
    end
  end
end
