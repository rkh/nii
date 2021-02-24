# frozen_string_literal: true

class Nii::RBNF
  # @api internal
  class Parser
    # PUBLIC_RULESET  = /\s*%([\w\-]+)\s*:\s*/m
    # PRIVATE_RULESET = /\s*%%([\w\-]+)\s*:\s*/m
    # RULE            = /\s*([^%\s\:\;][^\:\;]*)?;\s*/

    SET    = %r{ \s* (?<prefix>%%?) (?<name>[\w\-]+) : \s* }mx
    SIMPLE = %r{ \s* (?!%) '? (?<body>[^:;]*) ; }mx
    RULE   = %r{ \s* (?<descriptor>[\w\-\./]+) : \s* '? (?<body>[^;:]*) ; \s*  }mx

    # @see RBNF.load
    def parse(source, file_name)
      rule_sets = []

      tokenize(source, file_name).each do |type, descriptor, body|
        case type
        when :set
          klass = body == 'lenient-parse' ? LenientParse : RuleSet
          rule_sets << klass.new(body, prefix: descriptor, private: descriptor == '%%')
        when :rule
          rule_sets.last.add_rule(descriptor, body)
        else
          raise
        end
      end

      Compiler.new(rule_sets, file_name)
    end

    # @see #parse
    def tokenize(source, file_name)
      scanner = StringScanner.new(source)
      tokens  = [] 

      until scanner.eos?
        case
        when scanner.scan(SET)    then tokens << [:set, scanner[:prefix], scanner[:name]]
        when scanner.scan(SIMPLE) then tokens << [:rule, nil, scanner[:body]]
        when scanner.scan(RULE)   then tokens << [:rule, scanner[:descriptor], scanner[:body]]
        else raise SyntaxError, "unexpected character: #{scanner.peek(1).inspect} in #{file_name}:#{scanner.pos}"
        end
      end

      tokens.unshift([:set, '%', 'default']) if tokens.first&.first != :set
      tokens
    end
  end
end
