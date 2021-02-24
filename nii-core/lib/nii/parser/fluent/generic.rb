# frozen_string_literal: true
module Nii::Parser
  module Fluent
    class Generic
      LINE_END = /\r\n|\n|\z/

      def self.parse!(parser, **options)
        snapshot = parser.pos
        result   = new

        if result.parse!(parser, **options)
          result
        else
          parser.pos = snapshot
          nil
        end
      end

      attr_reader :parser, :byte_start, :byte_end, :char_start, :char_end, :children

      def parse!(parser, **options)
        @byte_start = parser.pos
        @char_start = parser.charpos
        @parser     = parser
        success     = !!parse(**options)
        @byte_end   = parser.pos
        @char_end   = parser.pos
        success
      end

      def joinable?(other)
        other.class == self.class
      end

      def join?(other)
        false
      end

      def join(other)
        @byte_end = other.byte_end
        @char_end = other.char_end
      end

      def initialize
        @children = []
      end

      def parse
        raise NotImplementedError, 'subclass responsiblity'
      end

      def join_children?
        true
      end

      def ignore?
        false
      end

      def <<(element)
        return self if element.ignore?
        if join_children? and children.last&.joinable?(element) and children.last.join?(element)
          children.last.join(element)
        else
          children << element
        end
        self
      end

      def to_sexp
        args = sexp_args
        if args.is_a? Array
          while args.any? and args.last == nil or args.last == []
            args = args[0..-2]
          end
        end

        [ self.class.name[/[^:]+$/].downcase.to_sym, *args ]
      end

      def sexp_args
        children.map(&:to_sexp)
      end
    end
  end
end
