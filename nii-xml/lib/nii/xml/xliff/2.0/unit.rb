# frozen_string_literal: true

module Nii::XML
  # @api internal
  class XLIFF['2.0']::Unit < XLIFF::Unit
    def source_locale     = file.source_locale
    def target_locale     = file.target_locale
    def name              = xml['name'] || super
    def xml_segments      = xpath('./segment|./ignorable')
    def segment_type(xml) = xml.name
  end
end
