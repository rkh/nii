# frozen_string_literal: true

module Nii::Sinatra
  module Extension
    def self.registered(base)
      base.helpers Helpers
    end
  end
end
