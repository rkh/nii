# frozen_string_literal: true

module Nii::Parser
  module Properties
    IGNORE  = /^[!#]|^\s*$/
    PATTERN = /^(\w+)\s*=(.*)$/
    private_constant :IGNORE, :PATTERN

    extend self

    def parse(source)
      source.lines.map do |line|
        case line
        when IGNORE
        when PATTERN then [$1, $2.strip]
        else raise Nii::Errors::ParseError, "cannot parse property: #{line.inspect}" unless line
        end
      end.compact.to_h
    end
  end
end
