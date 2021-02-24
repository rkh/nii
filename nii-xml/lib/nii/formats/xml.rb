# frozen_string_literal: true

module Nii::Formats
  class XML
    def initialize(config)
      @config = config
    end

    def single_message?
      false
    end

    def compile(bundle, source)
      document = Nokogiri::XML(source)
      raise NotImplementedError
    end
  end
end
