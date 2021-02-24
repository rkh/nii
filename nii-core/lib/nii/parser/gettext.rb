# frozen_string_literal: true

module Nii::Parser
  module Gettext
    extend self

    def parse(input)
      input   = StringScanner.new(input)
      output  = []
      flags   = []
      message = nil

      until input.eos?
        case char = input.getch
        when /\s/
          flags   = []
          message = nil
        when '#'
          message = nil
          line    = input.scan_until(/\n/)
          flags   = line.split(',').map(&:strip).reject(&:empty?) if line[0] == ','
        when 'm'
          if message.nil?
            message = { 'flags' => flags }
            flags   = []
            output << message
          end
          key = char + Nii::Utils.string(input.scan_until(/(?=\s)/))
          message[key] = parse_string(input)
        else
          raise Nii::Errors::ParseError, "unexpected symbol: #{char.inspect}"
        end
      end

      output
    end

    def parse_string(input)
      raise ParseError, "unexpected symbol: #{input.peek(1).inspect}" unless result = parse_string_part(input)
      while substring = parse_string_part(input)
        result << substring
      end
      result
    end

    def parse_string_part(input)
      return unless input.scan(/[ \t]*"/)
      result = String.new
      while char = input.getch and char != '"'
        if char == '\\'
          case escaped = input.getch
          when nil then raise Nii::Errors::ParseError, 'unexpected end of input'
          when 'n' then result << "\n"
          when 'r' then result << "\r"
          when 't' then result << "\t"
          else          result << escaped
          end
        else
          result << char
        end
      end
      input.scan(/[ \t]*\r?\n/)
      result
    end
  end
end
