# frozen_string_literal: true

module Nii::Parser
  # @note
  #   This isn't a full implementation of unicode sets, only what is needed to handle CLDR data.
  #   Specifically, only posix match patterns supported by Ruby's Regexp implementation are available,
  #   and code point matches by name (\N) are not supported.
  #
  #   This implementation is not intended for user input. It allows generating any possible regular expression
  #   and thus is susceptible ReDoS attacks. It also caches input strings and output expressions and could
  #   open up a memory attack.
  #
  # Compiles a Unicode sets into a regular expression.
  module UnicodeSet
    CACHE = {}
    private_constant :CACHE
    
    extend self

    def parse(source)
      source = Nii::Utils.string(source)
      source = source.dup.freeze unless source.frozen?
      CACHE[source] ||= Regexp.new(compile(tokenize(source)), Regexp::MULTILINE)
    end

    private

    def compile(tokens)
      case tokens
      in [ :union                ] then '(?:$.^)'
      in [ :union, element       ] then compile(element)
      in [ :union, *elements     ] then "(?:#{elements.map { compile(_1) }.join(?|)})"
      in [ :char,  char          ] then Regexp.escape(char)
      in [ :range, first, last   ] then "[#{compile(first)}-#{compile(last)}]"
      in [ :prop,  mode,  prop   ] then "\\#{mode}{#{prop}}"
      in [ :diff,  first, second ] then "(?!#{compile(second)})#{compile(first)}"
      in [ :sect,  first, second ] then "(?=#{compile(second)})#{compile(first)}"
      end
    end

    def tokenize(source)
      scanner = StringScanner.new(source)
      stack   = [[:union]]

      until scanner.eos?
        check_range = false

        if scanner.scan(/\s+|\[\-\]/)
          # do nothing
        elsif scanner.scan(/\[:([^:]+):\]/)
          stack.last << [:prop, 'p', scanner[1]]
        elsif scanner.scan(/\\([pP]){([^}]+)}/)
          stack.last << [:prop, scanner[1], scanner[2]]
        elsif scanner.scan(/\[/)
          stack.last << [:union]
          stack << stack.last.last
        elsif scanner.scan(/\]/)
          stack.pop
        elsif scanner.scan(/\\x([0-9A-Fa-f]{2})|\\u([0-9A-Fa-f]{4})|\\U([0-9A-Fa-f]{8})|\\[xu]\{([0-9A-Fa-f\s]+)\}/)
          scanner.captures.compact.flat_map { _1.strip.split(/\s+/) }.each { stack.last << [:char, eval(%Q{"\\u{#{_1}}"})] }
          check_range = true
        elsif scanner.scan(/\\[abtnvfr\\]/)
          stack.last << [:char, eval(%Q{"#{scanner.matched}"})]
          check_range = true
        elsif scanner.scan(/\\N/)
          raise Nii::Errors::CompileError, '\\N is not supported by Ruby'
        elsif scanner.scan(/[\-\&]/)
          last  = stack.pop
          entry = [scanner.matched == ?- ? :diff : :sect, last]
          stack.last.pop if stack.last&.last == last
          stack.last << entry if stack.last
          stack << entry
        else
          stack.last << [:char, scanner.getch]
          check_range = true
        end

        if check_range and scanner.scan(/\-/)
          start = stack.last.pop
          stack.last << [:range, start]
          stack << stack.last.last
        end

        case stack.last
        in [:range, first, second] then stack.pop
        else nil
        end
      end

      raise Nii::Errors::ParseError, "unexpected end of string (#{source.inspect})" if stack.size > 1
      stack.first
    end
  end
end
