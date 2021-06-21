# frozen_string_literal: true

module Nii::XML
  # @api internal
  class XLIFF['1.2']::File < XLIFF::File
    def external_skeleton? = !!at_xpath('./skl/external-file')
    def embedded_skeleton? = !!at_xpath('./skl/internal-file')

    def available_locales
      @available_locales ||= units.flat_map { [_1.source_locale, _1.target_locale] }.compact.uniq
    end

    private
    def unit_nodes    = xpath('.//trans-unit')
    def skeleton_href = at_xpath('./skl/external-file/@href')&.to_s
  end
end
