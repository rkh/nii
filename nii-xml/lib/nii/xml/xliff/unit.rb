# frozen_string_literal: true

module Nii::XML
  # Each file translated by an XLIFF document may contain multiple units containing translations.
  class XLIFF::Unit < Element
    # @return [Nii::XML::XLIFF::File]
    attr_reader :file

    # @!attribute [r] source_locale
    # @return [Nii::Locale] locale of the source payload

    # @!attribute [r] target_locale
    # @return [Nii::Locale, nil] locale of the target payload

    # @api internal
    def initialize(file, xml)
      @file = file
      super(xml)
    end

    # @!attribute [r] document
    # @return [Nii::XML::XLIFF]
    def document = file.document

    # @!attribute [r] name
    # @return [String] unit name (or id if no name is set)
    def name = id
    
    # @!attribute [r] id
    # @return [String] unit id
    def id = xml['id']

    # @!attribute [r] segments
    # @return [Array<Nii::XML::XLIFF::Segment>]
    def segments = @segments ||= xml_segments.map { XLIFF::Segment.new(self, _1) }

    # @return [true, false]
    #   whether the translation unit has been translated to the target locale
    def target? = target_locale && segments.all?(&:target)

    # @return [String] text in the source locale
    def source = @source ||= segments.inject(String.new) { _1 << _2.source }
    
    # @return [String] text in the target locale
    # @raises [Nii::Errors::CompileError]
    #   if the unit hasn't been fully translated.
    #   Check {#translated?} to avoid this exception.
    def target
      @target ||= begin
        raise CompileError, "unit has not been fully translated" unless target?
        segments.inject(String.new) { _1 << _2.target }
      end
    end
  end
end
