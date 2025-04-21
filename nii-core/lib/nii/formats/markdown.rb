# frozen_string_literal: true

module Nii::Formats
  class Markdown < TXT
    EXTENSIONS = %w[md mkd markdown]

    # @api internal
    def compile_template(bundle, source)
      template = tilt_template.new { source }
      super bundle, Nii::HTML.safe(template.render)
    end

    private

    def tilt_template
      require 'tilt' unless defined? Tilt
      Tilt[EXTENSIONS.first]
    rescue LoadError => error
      format = self.class.name[/[^:]+$/]
      needed = error.path == 'tilt' ? 'Tilt' : "a #{name} implementation"
      raise Nii::Errors::DependencyMissing,
        "Install #{format} for #{name} support. See https://github.com/rtomayko/tilt for more information."
    end
  end
end
