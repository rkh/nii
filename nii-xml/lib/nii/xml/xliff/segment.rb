# frozen_string_literal: true

module Nii::XML
  # Any XLIFF document may include multiple file translations.
  class XLIFF::Segment < Element
    # @return [Nii::XML::XLIFF::Unit]
    attr_reader :unit

    # @api internal
    def initialize(unit, xml)
      @unit = unit
      super(xml)
    end

    # @!attribute [r] file
    # @return [Nii::XML::XLIFF::File]
    def file = unit.file

    # @!attribute [r] document
    # @return [Nii::XML::XLIFF]
    def document = file.document

    # @!attribute [r] source_locale
    # @return [Nii::Locale] locale of the source payload
    def source_locale = unit.source_locale

    # @!attribute [r] target_locale
    # @return [Nii::Locale, nil] locale of the target payload
    def target_locale = unit.target_locale

    # @!attribute [r] state
    # @return [String] initial, translated, reviewed, or final
    def state = xml['state'] || 'initial'
    
    # @!attribute [r] id
    # @return [String, nil] segment id
    def id = xml['id']
    
    # @!attribute [r] type
    # @return [String] segment or ignorable
    def type = unit.segment_type(xml)

    # @return [true, false] whether the type is ignorable
    def ignorable? = type == 'ignorable'

    # @!attribute [r] source
    # @return [String] source text for the segment
    def source = @source ||= compile(at_xpath('source'))
    
    # @!attribute [r] target
    # @return [String, nil] target text for the segment
    def target
      @target ||= begin
        target = compile(at_xpath('target'))
        ignorable? ? target || source : target
      end
    end

    private

    def compile(element)
      case element.name
      when 'text'             then element.text
      when 'source', 'target' then element.children.inject(String.new) { _1 << compile(_2) }
      when 'cp'               then element['hex'].hex.chr('UTF-8')
      else raise CompileError, "Unsupported tag: #{element.name}"
      end
    end
  end
end 
