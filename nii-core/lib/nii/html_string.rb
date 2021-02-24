# frozen_string_literal: true

module Nii
  # A string that is marked as HTML safe. Compatible with Rails and ActiveSupport,
  # but does not depend on either.
  # This is not as advanced as ActiveSupport::SafeBuffer. For instance, concatinating
  # two HTMLStrings will result in a normal String object.
  # An HTMLString is always frozen.
  #
  # Compatile with Rails/ActiveSupport.
  #
  # @example
  #   string = Nii::HTMLString.new("<br>") # => "<br>"
  #   string.html_safe? # => true
  class HTMLString < String
    # @param input [String, HTMLString]
    # @return [HTMLString]
    def self.new(input) = super(input).freeze

    # @return [true]
    def html_safe? = true
    
    # @return [self]
    def to_s = self
    alias_method :html_safe, :to_s
    alias_method :to_str,    :to_s
  end
end
