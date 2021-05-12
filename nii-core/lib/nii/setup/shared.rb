# frozen_string_literal: true

module Nii::Setup
  # Namespace for common setup options used by multiple setup scopes.
  module Shared
    autoload :Conditional, 'nii/setup/shared/conditional'
    autoload :Config,      'nii/setup/shared/config'
    autoload :Context,     'nii/setup/shared/context'
    autoload :Locales,     'nii/setup/shared/locales'
    autoload :Paths,       'nii/setup/shared/paths'
    autoload :Routing,     'nii/setup/shared/routing'
  end
end
