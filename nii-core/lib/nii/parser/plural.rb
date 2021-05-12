# frozen_string_literal: true

module Nii::Parser
  module Plural
    extend self

    # LITERAL       = /^([finv]|\d+)$/
    # COMPARE       = /^(.+)=(.+)$/
    # OPERAND       = /^(.+)(!=)(.+)$/
    # MODULO        = /^(.+)(?:%|mod)(.+)$/
    # RANGE_COMPARE = /^(.+)=\s*(-?\d+\s*..\s*-?\d+)\s*$/
    # LIST_COMPARE = /^(.+)=\s*(-?\d+\s*(?:,\s*-?\d+)+)\s*$/



    is_ops  = ['=', 'is', 'in', 'within']
    not_ops = ['!=', /is\s+not/, /not\s+(with)?in/]
    IS_OPS  = /\A#{Regexp.union(*is_ops)}\Z/
    NOT_OPS = /\A#{Regexp.union(*not_ops)}\Z/

    TERM = %r{
      \A
      (?<expression>[\s\%a-z\d]+)
      (?<operation>#{Regexp.union(*is_ops, *not_ops)})
      (?<value>[\s\d\.\,]+)
      \Z
    }xi

    EXPRESSION = %r{
      \A\s*
      (?<operand>[niftvwce])
      (?: \s* (?:%|mod) \s* (?<base>\d+) )?
      \s*\Z
    }xi

    NUMBER = /^\d+$/
    RANGE  = /^\d+\.\.\d+$/
    SPACE  = /\s+/

    def parse(source)
      return unless source = source[/^[^@]+/]
      conditions = source.split(/\bor\b/).map do |or_term|
        terms = or_term.split(/\band\b/).map { |term| parse_term(term) }
        "#{terms.join(' and ')}"
      end
      
      return conditions.first if conditions.size == 1
      conditions.map { "(#{_1})" }.join(' or ')
    end

    private
  
    def parse_term(term)
      complain('cannot parse term', term)                     unless match      = TERM.match(term)
      complain('cannot parse expression', match[:expression]) unless expression = EXPRESSION.match(match[:expression])

      operand = expression[:operand].gsub(SPACE, '')
      if base = expression[:base]&.gsub(SPACE, '')
        expression = "(#{operand} % #{base})"
      else
        expression = operand
      end

      case match[:operation]
      when IS_OPS  then positive = true
      when NOT_OPS then positive = false
      else complain('unsupported operation', match[:operation])
      end

      operations = match[:value].split(',').map do |value|
        case value = value.gsub(SPACE, '')
        when NUMBER then "#{expression} #{positive ? :== : :!=} #{value}"
        when RANGE  then "#{?! unless positive}(#{value}).include?(#{expression})"
        else complain('cannot parse value', value)
        end
      end

      operations.join(' || ')
    end

    def complain(message, value) = raise(Nii::Errors::ParseError, "#{message}: #{value.inspect}")
  end
end
