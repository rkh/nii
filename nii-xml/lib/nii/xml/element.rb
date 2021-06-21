# frozen_string_literal: true

module Nii::XML
  # @abstract Superclass for Nii objects that are directly mapped to Nokogiri XML nodes.
  class Element
    include Nii::Errors

    # @return [Nokogiri::XML::Node]
    attr_reader :to_node
    alias_method :xml, :to_node

    # @return [Hash]
    attr_reader :options

    # @api internal
    def initialize(xml, **options)
      @options = options.freeze
      @to_node = xml
    end

    # @option options [String, Encoding] encoding
    #   character encoding to use
    #
    # @option options [String] indent_text (" ")
    #   the indentation text to use
    #
    # @option options [Integer] indent (2)
    #   the number of +indent_text+ to use per indentation level
    #
    # @return [String] XML representation of the element
    def to_xml(**options) = to_node.to_xml(options)

    # @private
    def inspect
      name  = options[:name] || xml.attr('name') || xml.attr('resname') || xml.attr('id') || xml.name
      "#<#{self.class.ancestors.detect { _1.name !~ /^\#/ }.name}:#{name.inspect}>"
    end

    private

    def xpath(...)    = to_node.xpath(...)
    def at_xpath(...) = to_node.at_xpath(...)
    def css(...)      = to_node.css(...)
    def at_css(...)   = to_node.at_css(...)
  end
end
