# frozen_string_literal: true

module Nii::Setup
  # Setup scope inside a `domain` setup block.
  class RouteScope
    include Shared::Config, Shared::Context, Shared::Paths, Shared::Locales

    # @api internal
    def initialize(config)
      @config = config
      super()
    end
  end
end
