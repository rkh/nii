# frozen_string_literal: true

module Nii::Formats
  class XML
    EXTENSIONS                  = %w[xml]
    def initialize(config)      = @config = config
    def single_message?         = false
    def compile(bundle, source) = base_format.load(source).compile(bundle)
    def base_format             = Nii::XML::Document
  end
end
