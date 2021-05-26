# frozen_string_literal: true

module Nii::Compiler
  # @see Nii::Compiler::Variables.compile
  class Variables
    # @api internal
    attr_reader :result

    # @api internal
    def initialize(**)
      @result = []
    end

    # Compiles a message into a list of variables used by the message.
    # @param message [Nii::Message]
    # @return [Array<String>]
    # @see Nii::Message#variables
    # @!scope module
    def compile(message)
      result  = Array(scan(message)).compact.uniq.freeze
      @result = (result + @result).uniq.freeze
      result
    end

    private

    def scan(node)
      case node
      in Nii::Template::Variable[name, default] then name.freeze
      in Nii::Message[*, template, attributes]  then scan(template).concat(scan(attributes.values))
      in Nii::Template::Element                 then node.dispatch.flat_map { scan(_1) }
      in *elements                              then elements.map { scan _1 }
      end
    end
  end
end
