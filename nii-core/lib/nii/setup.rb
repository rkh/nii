# frozen_string_literal: true

module Nii
  module Setup
    autoload :DSL,        'nii/setup/dsl'
    autoload :Finalized,  'nii/setup/finalized'
    autoload :Helpers,    'nii/setup/helpers'
    autoload :Locale,     'nii/setup/locale'
    autoload :Lookup,     'nii/setup/lookup'
    autoload :Middleware, 'nii/setup/middleware'
    autoload :RouteScope, 'nii/setup/route_scope'
    autoload :Shared,     'nii/setup/shared'
    autoload :Vanilla,    'nii/setup/vanilla'

    def self.new(application = nil, **options, &block)
      klass = constants.map { |c| const_get(c, false) }.detect { |c| c.respond_to?(:for?) and c.for? application }
      raise ArgumentError, "don't know how to run setup for #{application.inspect}" unless klass
      klass.setup(application, **options, &block)
    end

    def self.load(*arguments, path: nil, **options, &block)
      paths        = arguments.select { _1.is_a? String or _1.is_a? Pathname }
      applications = arguments == paths ? [nil] : arguments - paths

      applications.each do |application|
        new(application, **options) do |dsl|
          dsl.load(*paths, path: path) if paths.any?
          dsl.run(&block)
        end
      end
    end
  end
end
