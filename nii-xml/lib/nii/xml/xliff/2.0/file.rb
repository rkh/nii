# frozen_string_literal: true

module Nii::XML
  # @api internal
  class XLIFF['2.0']::File < XLIFF::File
    def available_locales  = @available_locales ||= [source_locale, target_locale].compact
    def source_locale      = @source_locale     ||= Nii::Locale.parse(at_xpath('/xliff/@srcLang').to_s)
    def skeleton?          = !!skeleton_node
    def external_skeleton? = !!skeleton_href
    def embedded_skeleton? = skeleton? && !external_skeleton?

    def target_locale
      @target_locale ||= if trg_lang = at_xpath('/xliff/@trgLang') 
        Nii::Locale.parse(trg_lang.to_s)
      end
    end

    private
    def unit_nodes    = xpath('.//unit')
    def skeleton_href = at_xpath('./skeleton/@href')&.to_s
    def skeleton_node = at_xpath('./skeleton')
  end
end
