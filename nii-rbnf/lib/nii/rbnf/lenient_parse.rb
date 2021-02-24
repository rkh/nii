# frozen_string_literal: true

class Nii::RBNF
  # Dummy for %lenient-parse rule sets.
  #
  # @todo implement parsing
  # @api internal
  class LenientParse
    # @see RuleSet#initialize
    def initialize(*, **)
    end

    # @see RuleSet#add_rule
    def add_rule(*)
    end

    # @see RuleSet#compile
    def compile(*)
    end
  end
end
