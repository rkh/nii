# frozen_string_literal: true

module Nii::Parser
  module Message
    extend self

    ParseError    = Nii::Errors::ParseError
    OPEN          = /[\$%#]?\{\s*/
    CLOSE         = /\s*\}/
    UNICODE       = /\\u([0-9a-fA-F]{4})|\\(U[0-9a-fA-F]{6})|\\[uU]\{[(0-9a-fA-F)]+\}/
    COMMA         = /\s*,\s*/
    ESCAPE        = /\\(.)/
    NUMBER        = /\-?\d+/
    IDENTIFIER    = /\$?([a-z][\w\.]*)/
    OPTION        = /([a-z]\w*):/
    MATCHER       = /\s*(?:([<=>])(#{NUMBER})|(\w+))\s*\{/
    MATCHER_CLOSE = /\}/
    SKELETON      = /::([^\,\}]*)/
    ESCAPES       = { ?n => ?\n, ?t => ?\t, ?r => ?\r, ?f => ?\f, ?v => ?\v, ?s => ?\s }

    def parse(input, **, &done)
      input  = StringScanner.new(input)
      tokens = []
      append(tokens, scan_element(input).dup) until input.eos?
      tokens
    end

    private

    def append(list, item)
      list = list.last if item.is_a? String and list.last.is_a? String
      list << item
    end

    def scan_element(input) = placeable(input) || literal(input)

    def literal(input)
      return input.captures.join.hex.chr('UTF-8') if input.scan(UNICODE)
      return ESCAPES.fetch(input[1], input[1])    if input.scan(ESCAPE)
      input.getch
    end

    def placeable(input)
      attempt(input) do
        return unless input.scan(OPEN)
        if nested = placeable(input)
          raise ParseError unless input.scan(CLOSE)
          return nested
        end
        raise ParseError unless identifier = identifier(input)
        identifier = :"#{identifier}" if identifier.is_a? Integer
        tokens = [identifier]
        until input.scan(CLOSE)
          raise ParseError unless input.scan(COMMA)
          element = icu_select(input) || [skeleton(input) || identifier(input)]
          tokens += element
        end
        tokens
      end
    end

    def skeleton(input)
      input[1] if input.scan(SKELETON)
    end

    def identifier(input)
      return Number.parse(input.matched) if input.scan(NUMBER)
      input[1].to_sym if input.scan(IDENTIFIER)
    end

    def icu_select(input)
      attempt(input) do
        variants = []
        options  = {}
        options[input[1].to_sym] = identifier(input) while input.scan(OPTION)
        while input.scan(MATCHER)
          condition = input[1] if input[1] != '='
          condition = condition&.to_sym || :==
          element   = [condition, input[2] ? Number.parse(input[2]) : input[3], []]
          until input.scan(MATCHER_CLOSE)
            raise ParseError if input.eos?
            append(element.last, scan_element(input).dup)
          end
          variants << element
        end
        result = [options, *variants].compact.reject(&:empty?)
        result if result.any?
      end
    end

    def attempt(input)
      position = input.pos
      yield
    rescue ParseError
      input.pos = position
      nil
    end
  end
end
