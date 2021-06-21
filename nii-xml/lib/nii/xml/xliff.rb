# frozen_string_literal: true

module Nii::XML
  # XLIFF document implementation. Supports XLIFF 1.2, 2.0, and 2.1.
  class XLIFF < Document
    # @api internal
    VERSIONS = { '1.2' => Module.new, '2.0' => Module.new, '2.1' => Module.new }

    VERSIONS.each_pair do |version, namespace|
      namespace.autoload :File, "nii/xml/xliff/#{version}/file"
      namespace.autoload :Unit, "nii/xml/xliff/#{version}/unit"
    end

    autoload :File,    'nii/xml/xliff/file'
    autoload :Segment, 'nii/xml/xliff/segment'
    autoload :Unit,    'nii/xml/xliff/unit'

    # @api internal
    def self.[](version) = VERSIONS[version]

    # @api internal
    def self.matches?(xml) = xml.children.first&.name == 'xliff'

    # @!attribute [r] version
    # @return [String] XLIFF version
    def version
      @version ||= begin
        version = at_xpath('/xliff/@version').to_s
        raise ParseError, 'Unknown XLIFF version' if version.empty?
        raise CompileError, "Unsupported XLIFF version: #{version.inspect}" unless VERSIONS.include? version
        version
      end
    end

    # @overload [](file_id)
    #   Look up a file by id.
    #   @return [Nii::XML::XLIFF::File, nil]
    #
    # @overload [](file_id, unit_id)
    #   Look up a unit by id.
    #   @return [Nii::XML::XLIFF::Unit, nil]
    def [](file_id, unit_id = nil)
      file_id = Nii::Utils.string(file_id)
      return unless file = files.detect { _1.id == file_id }
      unit_id ? file[unit_id] : file
    end

    # @!attribute [r] files
    # @return [Array<Nii::XML::XLIFF::File>] files translated in the XLIFF document
    def files = @files ||= xpath('/xliff/file').map { namespace::File.new(self, _1) }.freeze
    
    # @!attribute [r] units
    # @return [Array<Nii::XML::XLIFF::Unit>] translation unit included in the XLIFF document
    def units = @units ||= files.flat_map(&:units)

    # @!attribute [r] available_locales
    # @return [Array<Nii::Locale>] List of locales defined in the XLIFF document
    def available_locales = @available_locales ||= files.flat_map(&:available_locales).uniq

    # @api internal
    def compile(bundle) = files.each { _1.compile(bundle) }

    # @api internal
    def namespace = XLIFF[version]
  end
end
