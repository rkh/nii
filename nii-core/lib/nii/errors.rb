# frozen_string_literal: true

module Nii
  module Errors
    ParseError        = Class.new(StandardError)
    CompileError      = Class.new(ParseError)
    SetupError        = Class.new(StandardError)
    DependencyMissing = Class.new(SetupError)
    ConversionError   = Class.new(StandardError)
    UnknownLocale     = Class.new(ArgumentError)
    UnknownTimezone   = Class.new(UnknownLocale)
    MessageError      = Class.new(StandardError)
    UnknownMessage    = Class.new(MessageError)
    UnknownVariable   = Class.new(MessageError)
    UnknownFunction   = Class.new(MessageError)
    UnknownAttribute  = Class.new(MessageError)
  end
end
