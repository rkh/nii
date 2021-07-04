# frozen_string_literal: true

class Nii::RBNF
  # Compiles a list of {RuleSet}s into an {RBNF}.
  # @api internal
  class Compiler
    attr_reader :file_name, :subject

    # Mapping for special descriptors
    SPECIAL_RULES = {
      '-x' => [
        'number < 0',
        'gt, lt = nil, -number'
      ],
      'x.x' => [
        'number.finite? and number.is_a?(Float) or number.denominator != 1',
        'split = number.to_f.to_s.split(?.); gt, lt = split[0].to_i, split[1].chars.map(&:to_i)'
      ],
      'x,x' => [ 'false', 'raise' ], # todo: spanish has this rule, not sure how to trigger it
      '0.x' => [
        'number < 1 and number > 0',
        'split = number.to_f.to_s.split(?.); gt, lt = split[0].to_i, split[1].chars.map(&:to_i)'
      ],
      'x.0' => [
        'number.is_a? Float and number.finite? and number == number.to_i',
        'split = number.to_f.to_s.split(?.); gt, lt = split[0].to_i, split[1].chars.map(&:to_i)'
      ],
      'Inf' => [
        'number.infinite?',
        'gt = lt = nil'
      ],
      'NaN' => [
        'number.respond_to? :nan? and number.nan?',
        'gt = lt = nil'
      ],
    }

    # @param rule_sets [Array<RuleSet>]
    # @param file_name [String, nil]
    def initialize(rule_sets, file_name)
      @rule_sets = rule_sets
      @file_name = file_name
    end

    # @see RBNF.load
    def compile(plural_callback:, **options)
      @subject = Nii::RBNF.new(plural_callback, **options)
      @rule_sets.each { |r| r.compile(self) }
      @subject
    end

    # @see RuleSet#compile
    def rule(method, condition, body)
      compiled_condition, variables = compile_condition(condition)
      <<-RUBY
        if #{compiled_condition}
          #{variables}
          return #{compile_body(method, body)}
        end
      RUBY
    end

    # @see #rule
    def compile_body(method, body)
      scanner = StringScanner.new(body)
      result  = String.new('"')

      until scanner.eos?
        case char = scanner.getch
        when '='
          case
          when scanner.scan(/(%%?[^=]+)=/) then result << '#{send(' << scanner[1].inspect << ', number)}'
          when scanner.scan(/([^=]+)=/)    then result << '#{decimal_format(number, ' << scanner[1].inspect << ', **options)}'
          when scanner.scan(/=/)           then result << '#{replace_digits(number)}'
          else raise SyntaxError, "unexpected symbol: #{scanner.peek(1).inspect}"
          end
        when '←'
          case
          when scanner.scan(/(%%?[^←]+)←/) then result << '#{send(' << scanner[1].inspect << ', gt)}'
          when scanner.scan(/([^←]+)←/)    then result << '#{decimal_format(gt, ' << scanner[1].inspect << ', **options)}'
          when scanner.scan(/←|\z/)        then result << '#{send(' << method.inspect << ', gt)}'
          else raise SyntaxError, "unexpected symbol: #{scanner.peek(1).inspect}"
          end
        when '→'
          case
          when scanner.scan(/(%%?[^→]+)→→?/) then result << '#{send(' << scanner[1].inspect << ', lt)}'
          when scanner.scan(/([^→]+)→→?/)    then result << '#{decimal_format(lt, ' << scanner[1].inspect << ', **options)}'
          when scanner.scan(/→→?/)           then result << '#{send(' << method.inspect << ', lt)}'
          else raise SyntaxError, "unexpected symbol: #{scanner.peek(1).inspect}"
          end
        when '['
          raise SyntaxError, "unexpected symbol: [" unless scanner.scan(/([^\]]+)\]/)
          condition = scanner[1].include?('←') ? 'gt' : 'lt'
          subresult = compile_body(method, scanner[1])
          result << '#{' << subresult << " if #{condition} and #{condition} > 0}"
        when '$'
          if scanner.scan(/\((cardinal|ordinal),((?:\w+{[^}]*})*)\)\$/)
            options = scanner[2].scan(/(\w+){([^}]*)}/).to_h.transform_keys(&:to_sym)
            result << '#{' << options.inspect << "[plural_category(#{scanner[1].inspect}, number)]}"
          else
            result << char
          end
        when "'"
          result << scanner.getch.inspect[1..-2]
        else
          result << char.inspect[1..-2]
        end
      end

      result << '"'
    end

    # @see #rule
    def compile_condition(condition)
      if result = SPECIAL_RULES[condition]
        result
      else
        raise 'should not get here' unless match = RuleSet::DESCRIPTOR.match(condition)
        bv   = match[:bv].to_i
        rad  = match[:rad]&.to_i || 10
        exp  = -match[:suffix].to_s.size
        exp += 1 while rad ** (exp + 1) <= bv
        ["number >= #{bv}", "gt, lt = number.divmod(#{exp >= 0 ? rad ** exp : 1})"]
      end
    end

    # @see RuleSet#compile
    def define(method, body)
      @subject.instance_eval <<-RUBY
        # frozen_string_literal: true
        define_singleton_method(#{method.inspect}) do |number, **options|
          return if number.nil?
          return number.map { |n| send(#{method.inspect}, n, **options) }.join if number.is_a? Array
          #{body}
        end
      RUBY
    end
  end
end
