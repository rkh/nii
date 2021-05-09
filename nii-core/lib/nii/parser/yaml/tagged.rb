# frozen_string_literal: true
require 'delegate'

module Nii::Parser::YAML
  module Tagged
    PATTERN = /^tag(?:\:yaml\.org,2002)?\:(.+)|^!(.+)$/
    NO_TAGS = [Tagged, nil, false, true]
    Array   = Class.new(::Array)         { include Tagged }
    Hash    = Class.new(::Hash)          { include Tagged }
    String  = Class.new(::String)        { include Tagged }
    Object  = Class.new(SimpleDelegator) { include Tagged }

    def self.new(object)
      case object
      when *NO_TAGS then object
      when ::Array  then Array.new(object)
      when ::Hash   then Hash.new.merge! object
      when ::String then String.new(object)
      else Object.new(object)
      end
    end

    attr_reader :yaml_tag, :yaml_tags, :nested_yaml_tags

    def yaml_tag?         = !!yaml_tag
    def yaml_tags?        = yaml_tags.any?
    def nested_yaml_tags? = nested_yaml_tags.any?

    def yaml_tag=(value)
      value             = $1 || $2 if value =~ PATTERN
      @yaml_tag         = value.freeze
      @yaml_tags        = value ? Set.new([value]) : Set.new
      @nested_yaml_tags = Set.new

      if is_a? Enumerable
        iterator = is_a?(Hash) ? each_value : each
        iterator.each { @nested_yaml_tags.merge(_1.yaml_tags) if _1.respond_to? :yaml_tags }
        @yaml_tags.merge(@nested_yaml_tags)
      end

      @nested_yaml_tags.freeze
      @yaml_tags.freeze
    end
  end
end
