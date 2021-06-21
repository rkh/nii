# frozen_string_literal: true

module Nii::Setup::Lookup
  class FileSystem < Common
    # @api setup
    def paths(*paths) = @sources.concat(paths)
    alias_method :path, :paths

    # @api setup
    def files(*paths) = add(:files, paths)
    alias_method :file, :files
  end
end
