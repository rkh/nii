# frozen_string_literal: true

module Nii::XML
  # @api internal
  class XLIFF['1.2']::Unit < XLIFF::Unit
    def source_locale
      @source_locale ||= begin
        locale = at_xpath('./source/@lang')
        Nii::Locale.parse(locale.to_s) if locale
      end
    end

    def target_locale
      @target_locale ||= begin
        locale = at_xpath('./target/@lang')
        Nii::Locale.parse(locale.to_s) if locale
      end
    end

    def name              = xml['resname'] || super
    def xml_segments      = [xml]
    def segment_type(xml) = 'segment'
  end
end
