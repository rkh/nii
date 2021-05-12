# frozen_string_literal: true

module Nii::Info
  class Grammar < Generic
    def formality = config.formality || locale.formality || config.default_formality || 'avoid'
    alias_method :tone, :formality
  end
end
