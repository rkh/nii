# frozen_string_literal: true

module Nii::Slim
  # @api internal
  class Parser < ::Slim::Parser
    # From the Slim documentation:
    # > Overwrite this method if you want to add line indicators to the Slim parser.
    def unknown_line_indicator
      return super unless @line =~ /\A\$/

      @line.slice! 0
      @line.gsub!(/\A\s*\{(.*)\}\s*\Z/, '\1')

      block = [:multi]
      @stacks.last << [:nii, @line, block]
      @stacks << block
    end
  end
end
