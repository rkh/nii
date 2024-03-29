# frozen_string_literal: true

module Nii::Formatters::Nii
  module Locale
    DIRECT_FORMAT = %i[script language region calendar_algorithm currency measurement_system]
    private_constant :DIRECT_FORMAT

    extend self
    # @see Nii::Context#format
    # @!scope module
    def format(context, value, **options)
      base_result = nil
      base_locale = value.lookup.detect { base_result = context.locale_data(:names, :languages, _1) }
      style       = ::Nii::Utils.string(options[:style] || 'default')
      base_result = base_result.fetch(style, base_result.fetch('default', base_result.values.first))    
      fields      = (value - base_locale).to_h
      info        = fields.flat_map do |key, value|
        next value.map { context.format(_1, as: :variant) } if key == :variants
        context.format(value, as: key, complain: false)
      end

      return base_result if info.empty?
      info = info.inject { context.text.separator.sub('{0}', _1).sub('{1}', _2) }
      context.text.display_pattern.sub('{0}', base_result).sub('{1}', info)
    end
  end
end
