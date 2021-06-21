# frozen_string_literal: true

module Nii::XML
  # @abstract Superclass for all supported XML file formats.
  class Document < Element
    # @api internal
    def self.formats
      @formats ||= begin
        subclasses = Nii::XML.constants.map { Nii::XML.const_get(_1) }.select { _1 < self }
        subclasses.any? ? subclasses.flat_map(&:formats) : [self]
      end
    end

    # @api internal
    def self.matches?(xml) = false

    # @param source [String, IO, Nokogiri::XML] source of the document to load
    # @return [Nii::XML::Document]
    def self.load(source, **options) = new(source, is_path: false, **options)

    # @param path [String, Pathname] file to load document from
    # @return [Nii::XML::Document]
    def self.load_file(path, **options) = new(path, is_path: true, **options)

    # @api internal
    def self.new(source, verify: true, is_path: nil, **options)
      unless source.is_a? Nokogiri::XML::Document
        is_path = !source.include?(?<) if is_path.nil? and source.is_a? String
        if is_path or source.is_a? Pathname
          options[:name] ||= Nii::Utils.string(source)
          source = File.open(source)
        end
        source = Nokogiri::XML(source)
      end

      format = verify ? formats.detect { _1.matches? source } : self
      format == self ? super(source, **options) : format.new(source, verify: false, **options)
    end

    # @api internal
    def initialize(xml, **options)
      xml.remove_namespaces!
      super
    end
  end
end
