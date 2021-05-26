# frozen_string_literal: true

module Nii::Template
  class Element
    attr_accessor :fluent
    attr_reader :bundle, :payload

    def initialize(bundle, payload)
      @payload = Nii::Utils.deep_freeze(payload)
      @bundle  = bundle
    end

    def resolve(context, variables, &block)
      return payload unless payload.is_a? Element
      payload.resolve(context, variables, &block)
    end

    def render(context, variables, &block) = context.format(resolve(context, variables, &block))
    def to_nii_template = self
    def inspect = "#<#{self.class.inspect}:#{payload.inspect}>"
    def deconstruct = [payload]
    def to_sexp = [Nii::Utils.type(self.class), *sexp(deconstruct)]
    
    def dispatch(&block)
      return enum_for(:dispatch) unless block
      each_child(&block)
    end

    private

    def each_child
      yield payload if payload.is_a? Element
    end

    def sexp(object)
      case object
      when Hash    then object.transform_values { sexp(_1) }
      when Array   then object.map { sexp(_1) }
      when Element then object.to_sexp
      else object
      end
    end
  end
end
