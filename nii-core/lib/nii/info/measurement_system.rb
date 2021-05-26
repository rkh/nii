# frozen_string_literal: true

module Nii::Info
  # This will be exposed as {Nii::Context#measurement_system}.
  # @see Nii::Context#method_missing
  class MeasurementSystem < Generic
    def [](key)
      value = config.measurement_system unless context.explicit_locale?
      value ||= locale(true).measurement_system

      case key&.to_sym
      when nil, :general
        value ||= territory.measurement_system
      when :temperature
        value ||= territory.temperature
      when :paper_size
        case value
        when 'US'           then value = 'US-Letter'
        when 'UK', 'metric' then value = 'A4'
        when nil            then value = territory.paper_size
        end
      end

      value
    end

    def paper_size = self[:paper_size]

    def temperature = self[:temperature]

    def metric?(type = nil)
      expected = type&.to_sym == :paper_size ? 'A4' : 'metric'
      self[type] == expected
    end

    def imperial?(type = nil) = self[type] == 'UK'

    def us_customary?(type = nil)
      expected = type&.to_sym == :paper_size ? 'US-Letter' : 'US'
      self[type] == expected
    end

    def deconstruct = [to_s]

    def deconstruct_keys(keys) = to_h

    def to_s = self[:general]

    def to_sym = to_s.to_sym

    def to_h
      { general: self[:general], temperature: self[:temperature], paper_size: self[:paper_size] }
    end

    def inspect = "#<#{self.class}:#{to_s}>"
  end
end
