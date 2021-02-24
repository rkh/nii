# frozen_string_literal: true
module Nii::Parser
  module Fluent
    class Arguments < Generic
      attr_reader :names
      OPEN      = /[\n ]*\([\n ]*/
      CLOSE     = /[\n ]*\)[\n ]*/
      SEPEARTOR = /[\n ]*,[\n ]*/

      def parse
        return false unless parser.scan(OPEN)
        @positional = true
        @names      = []

        if argument = parse_argument
          self << argument
          while parser.scan(SEPEARTOR)
            break unless additional = parse_argument
            return if additional == :invalid
            self << additional
          end
        end
        
        return true if parser.scan(CLOSE)
        parser.hint(parser.check(LINE_END) ? 'unmatched opening paren' :
          "unexpected character #{parser.peek(1).inspect}, expecting closing paren")
      end

      def sexp_args
        [@names, *super]
      end

      def parse_argument
        if argument = parser.parse(:named)
          @positional = false
          if names.include? argument.name
            parser.hint 'named arguments must be unique'
            :invalid
          else
            names << argument.name
            argument
          end
        elsif argument = parser.parse(:expression)
          return argument if @positional
          parser.hint 'positional arg must not follow keyword args'
          :invalid
        end
      end

      def join_children?
        false
      end

      def compile(bundle, config)
        positional = []
        named      = {}

        children.each do |child|
          argument = child.compile(bundle, config)
          if child.respond_to? :named_argument? and child.named_argument?
            named[child.name.to_sym] = argument
          else
            positional << argument
          end
        end

        [ positional, named ]
      end
    end
  end
end
