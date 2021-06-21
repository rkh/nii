# frozen_string_literal: true
require 'yaml'
require 'json'
require 'pp'

module Nii::Compiler
  class I18n
    include Nii::Template

    def initialize(name: nil, as: :yaml, **)
      @name   = name
      @as     = as.to_sym
      @result = {}
    end

    def compile(message)
      locale  = message.locale
      name    = @name || message.name
      payload = { locale.to_s => { name => convert(message.template, true) }}
      @result = Nii::Utils.deep_merge(@result, payload)
      finalize(payload)
    end

    def result = finalize(@result)

    private

    def finalize(output)
      case @as
      when :yaml then output.to_yaml
      when :json then JSON.pretty_generate(output)
      when :ruby then String.new.tap { ::PP.pp(output, _1) }
      when :hash then output
      else raise Nii::Errors::CompileError, "unknown target: #{@as.inspect}"
      end
    end

    def convert(node, top_level = false)
      case node
      in Nii::HTMLString                                 then String.new(node)
      in String                                          then node
      in Concat[Select => s]                if top_level then convert(s, top_level)
      in Select[Variable['count', _], list] if top_level then list.map { variant(_1) }.inject(&:merge)
      in Concat[*elements]                               then elements.map { convert(_1) }.join
      in Variable[name, _]                               then "%{name}"
      in Element[payload]                                then convert(payload)
      else raise Nii::Errors::CompileError, "cannot compile #{node.class} to Ruby I18n syntax"
      end
    end

    def variant(variant)
      Array(variant.condition).map do |condition|
        condition = Nii::Utils.string(condition)
        condition = 'zero' if condition == '0'
        condition = 'one'  if condition == '1'
        [condition, convert(variant.payload)]
      end.compact.to_h
    end
  end
end
