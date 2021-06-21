# frozen_string_literal: true

module Nii::Setup::Lookup
  class Cascade < Common
    # @api internal
    def initialize(type = Nii::Lookup::Cascade, *sources, **options) = super

    # @api internal
    def any? = @sources.any?
    
    # @api internal
    def _build(config)
      backends = @sources.map { _1._build(config) }
      backends.size > 1 ? super(config.merge(backends: backends)) : backends.first
    end

    private

    def add_sources(lookup) = nil
  end
end
