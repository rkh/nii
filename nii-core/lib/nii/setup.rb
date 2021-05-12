# frozen_string_literal: true

module Nii
  module Setup
    autoload :DSL,        'nii/setup/dsl'
    autoload :Finalized,  'nii/setup/finalized'
    autoload :Helpers,    'nii/setup/helpers'
    autoload :Locale,     'nii/setup/locale'
    autoload :Middleware, 'nii/setup/middleware'
    autoload :RouteScope, 'nii/setup/route_scope'
    autoload :Shared,     'nii/setup/shared'
    autoload :Vanilla,    'nii/setup/vanilla'

    def self.new(application = nil, &block)
      klass = constants.map { |c| const_get(c, false) }.detect { |c| c.respond_to?(:for?) and c.for? application }
      raise ArgumentError, "don't know how to run setup for #{application.inspect}" unless klass
      klass.setup(application, &block)
    end
  end
end
