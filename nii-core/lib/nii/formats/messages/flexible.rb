# frozen_string_literal: true

module Nii::Formats::Messages
  # A general message format implementation with the following compatibility:
  # * Full superset of Ruby I18n interpolation syntax.
  # * Full superset of ARB interpolation syntax.
  # * Almost full superset of ICU syntax (escaping rules aren't fully compatible, not all formatters supported).
  # * Partially compatible with i18next interpolation syntax.
  # * Partially compatible with R18n syntax.
  # * Partially compatible with Fluent interpolation syntax (variable references only).
  class Flexible < Struct.new(:bundle)
    def self.compile(bundle, source)
      ast = Nii::Parser.message(source)
      new(bundle).compile(ast)
    end
    
    def compile(ast)
      case ast.size
      when 0 then Nii::Template::Element.new(bundle, '')
      when 1 then compile_element(ast.first)
      else Nii::Template::Concat.new(bundle, ast.map { compile_element(_1) })
      end
    end

    def compile_element(node)
      case node
      in String | Numeric            then Nii::Template::Element.new(bundle, node)
      in Symbol                      then Nii::Template::Variable.new(bundle, node)
      in [Symbol | String | Numeric] then compile_element(node.first)
      in [element, Symbol, *args]
        options = args.shift if args.first.is_a? Hash
        method  = :"icu_#{mode}"
        element = compile_element(element)
        raise Nii::Errors::CompileError, "unsupported ICU formatter: #{mode}" unless respond_to? method
        public_send(method, element, *args, **options)
      end
    end
  end
end
