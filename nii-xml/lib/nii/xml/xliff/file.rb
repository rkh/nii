# frozen_string_literal: true

module Nii::XML
  # Any XLIFF document may include multiple file translations.
  class XLIFF::File < Element
    # @return [Nii::XML::XLIFF]
    attr_reader :document

    # @!attribute [r] available_locales
    # @return [Array<Nii::Locale>] Locales defined for the file

    # @!attirbute [r] original
    # @return [String, nil] original file the source strings are based on
    def original = xml['original']
    
    # @!attibure [r] id
    # @return [String] file id
    def id = xml['id']

    # @api internal
    def initialize(document, xml)
      @document = document
      super(xml)
    end

    # @return [Nii::XML::XLIFF::Unit]
    def [](unit_id)
      unit_id = Nii::Utils.string(unit_id)
      units.detect { _1.id == unit_id }
    end

    # @return [true, false]
    #   whether the file has been translated to the target locale
    def target? = units.all?(:target)

    # @attribute [r] units
    # @return [Array<Nii::XML::XLIFF::Unit>]
    def units = @units ||= unit_nodes.map { document.namespace::Unit.new(self, _1) }

    # @retrun [true, false] whether or not the file comes with an embedded skeleton
    def embedded_skeleton? = false

    # @return [true, false] whether or not the file links to an external skeleton
    def external_skeleton? = false

    # @return [true, false] whether the file has a skeleton (internal or external)
    def skeleton? = embedded_skeleton? || external_skeleton?
  end
end
