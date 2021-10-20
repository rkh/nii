# frozen_string_literal: true

module Nii::Parser
  module TimePattern
    extend self

    PLACEHOLDER = %r{
      a+|b+|c+|d+|e+|f+|g+|h+|i+|j+|k+|l+|m+|n+|o+|p+|q+|r+|s+|t+|u+|v+|w+|x+|y+|z+|
      A+|B+|C+|D+|E+|F+|G+|H+|I+|J+|K+|L+|M+|N+|O+|P+|Q+|R+|S+|T+|U+|V+|W+|X+|Y+|Z+
    }x.freeze

    def parse(input)
      input  = StringScanner.new(input)
      result = []
      result << parse_token(input) until input.eos?
      result
    end

    def parse_token(input)
      return input.matched            if input.scan(/[^a-zA-Z']+/)
      return input.matched.to_sym     if input.scan(PLACEHOLDER)
      return input[1].gsub("''", "'") if input.scan(/'((?:[^']|'')+)'/)
      return "'"                      if input.scan(/''/)
      input.getch
    end
  end
end
