# frozen_string_literal: true

module Nii::Setup::Lookup
  class Cascade < Common
    # @api internal
    def initialize(type = Nii::Lookup::Cascade, *sources, **options)
      @force_cascade = false
      super
    end

    # @api internal
    def any? = @sources.any?

    # @api internal
    def force_cascade! = @force_cascade = true
    
    # @api internal
    def _build(config)
      backends = @sources.map { _1._build(config) }
      @force_cascade || backends.size > 1 ? super(config.merge(backends: backends)) : backends.first
    end

    private

    def add_sources(lookup) = nil
  end
end
