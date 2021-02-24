# frozen_string_literal: true

module Nii::Info
  class Generic
    # @return [Nii::Context]
    attr_reader :context

    # @api internal
    def initialize(context) = @context = context

    private

    def config               = context.locale_config
    def territory            = context.territory
    def locale(force = true) = context.locale(force)
    def locale_data(*keys)   = context.locale_data(*keys)
    def locale_info(*keys)   = locale_data(:info, *keys)
    def data                 = config.data
  end
end
