# frozen_string_literal: true

module Nii::Compiler
  class Fluent
    attr_reader :result
    include Nii::Template

    def initialize(name: nil, rename_invalid: false, **)
      @result         = String.new
      @name           = name
      @rename_invalid = rename_invalid
    end

    def compile(message)
      name   = check_identifier(@name || message.name, ?m)
      size   = name.size
      result = [[name, indent(source(message.template))]]
      
      message.attributes.each do |(attribute, content)|
        attribute = "  .#{check_identifier(attribute, ?a)}"
        size      = attribute.size if attribute.size > size
        result << [attribute, indent(source(content), 2)]
      end
      
      result = result.map { "#{_1.ljust(size)} = #{_2}" }.join(?\n)

      @result << "\n" unless @result.empty?
      @result << result << "\n"

      result
    end

    # @api internal
    def source(node, placeable: false, size: 0)
      case node
      in String                                        then string(placeable, node)
      in Element if node.fluent                        then node.fluent
      in Concat[*elements]                             then elements.map { source(_1, placeable: placeable) }.join
      in AttributeReference[payload, name, attributes] then wrap(placeable, "#{source(payload, placeable: true)}.#{name}", attributes(attributes))
      in FunctionCall[name, positional, named]         then wrap(placeable, name(node), attributes(positional, named, always: node.class == FunctionCall))
      in Variable[name, _]                             then wrap(placeable, name(node))
      in Select[payload, variants]                     then "{ #{source(payload, placeable: true)} -> #{compile_variants(variants)}}"
      in Variant[condition, default, payload]          then (default ? ' *' : '  ') + "[#{condition}] ".ljust(size) + source(payload)
      in Element[payload]                              then source(payload, placeable: placeable)
      else raise Nii::Errors::CompileError, "cannot compile #{node.class} to Fluent"
      end
    end

    private

    def indent(source, spacing = 0)
      return source unless source.include? "\n"
      source = source.split("\n").map { "  #{' '*spacing}#{_1}\n" }.join
      "\n#{source}\n"
    end

    def compile_variants(variants)
      variants = variants.flat_map do |variant|
        next variant unless variant.condition.is_a? Array
        variant.condition.map do |condition|
          variant.dup.tap { _1.condition = condition }
        end
      end

      size   = variants.map { _1.condition.to_s.size }.max + 3
      result = variants.map { source(_1, placeable: true, size: size) }.join("\n")
      "\n#{result}\n"
    end

    def string(wrapped, string)
      if string.respond_to? :html_safe? and string.html_safe? and Nii::HTML.escape(string) != string
        # string is HTML code and should not be escaped
        wrap(wrapped, "HTML(#{literal_string(string)})")
      elsif string =~ /[\{\}]|^\s*[\[\*\.]/m
        # string contains special characters and needs to be wrapped in a placeable
        wrap(wrapped, literal_string(string))
      else
        # other strings need to be a string literal only if we're inside a placeable
        wrapped ? literal_string(string) : string
      end
    end

    def literal_string(string) = "\"#{string.gsub('\\', '\\\\').gsub('"', '\\"')}\""

    def attributes(*entries, always: false)
      positional = []
      named      = []

      entries.each do |entry|
        next positional.concat(entry.map { source(_1, placeable: true) }) if entry.is_a? Array
        entry.each do |key, value|
          value = source(value, placeable: true)
          if key.is_a? Integer
            positional[key] = value
          else
            named << "#{check_identifier(key)}: #{value}"
          end
        end
      end
      
      arguments = positional + named
      return '' unless arguments.any? or always

      "(#{arguments.join(', ')})"
    end

    def name(node)
      case node
      when FunctionCall  then check_identifier(node, ?f).upcase
      when TermReference then "-#{check_identifier(node, ?t)}"
      when Variable      then "$#{check_identifier(node, ?v)}"
      else name
      end
    end

    def rename_invalid(name, prefix)
      name = name.gsub(/[^a-zA-Z0-9_-]/, '-')
      name = prefix + name unless name =~ /^[a-zA-Z]/
      name
    end

    def wrap(inside_placeable, *content)
      return content.join if inside_placeable
      "{ #{content.join} }"
    end

    def check_identifier(identifier, prefix)
      identifier = identifier.name if identifier.respond_to? :name
      identifier = Nii::Utils.string(identifier)
      identifier = rename_invalid(identifier, prefix) if @rename_invalid
      return identifier if identifier =~ /^[a-zA-Z][a-zA-Z0-9_-]*$/
      raise Nii::Errors::CompileError, "unable to compile message to Fluent: #{identifier.inspect} is not a valid identifier"
    end
  end
end
