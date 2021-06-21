# frozen_string_literal: true

module Nii::Setup::Lookup
  class Memory < Common
    # @api internal
    def __dsl__(&block) = @callback = block
  end
end
