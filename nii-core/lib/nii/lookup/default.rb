# frozen_string_literal: true

module Nii::Lookup
  # This class implements the default file system lookup strategy.
  #
  # Each directory in the {#load_path load path} is expected to have one subdirectory per locale with the following structure:
  # * Multi-message formats: A single file named like the namespace.
  # * Single-message formats: A subdirectory named after the namespace, with files named after the messages.
  # * Shared messages and terms in files starting with dash or underscore.
  #
  # Imagine the following file structure:
  #
  #   locales
  #     └─ en
  #         ├─ foo
  #         │  ├─ _shared.ftl
  #         │  ├─ bar.txt
  #         │  └─ bar.ftl
  #         ├─ _shared.ftl
  #         ├─ foo.ftl
  #         └─ bar.ftl
  #
  # This will offer the following three namespaces for locales matching English:
  # * +foo+: messages defined in +en/_shared.ftl+, +en/foo.ftl+, and +en/foo/bar.txt+ (as a message named +bar+).
  # * +bar+: messages defined in +en/_shared.ftl+ and +en/bar.ftl+.
  # * +foo/bar+: messages defined in +en/_shared.ftl+, +en/foo/_shared.ftl+, and +en/foo/bar.ftl+.
  class Default < FileSystem
    Nii::Lookup[:default] = self

    private

    def glob_pattern_for(locale, namespace)
      pattern       = config.locale ? String.new : String.new(locale.glob_pattern)
      count         = 0
      namespace     = remove_prefix(namespace)
      nesting       = namespace.split('/')
      single, multi = formats.keys.group_by { |ext| formats[ext].single_message? }.values_at(true, false)
      single      &&= "*.{#{single.join(',')}}"
      multi       &&= ".{#{multi.join(',')}}"

      nesting.each do |segment|
        pattern << '/'
        if multi
          count += 1
          pattern << '{{-,_}*' << multi << ','
        end
        pattern << segment
      end

      if multi
        if single
          pattern << '{'
          count += 1
        end
        pattern << multi
      end

      if single
        pattern << ',' if multi
        pattern << '/' << single
      end

      pattern << '}'*count
    end

    def scan_locales
      load_path.glob('*').map do |path|
        path.basename if path.directory?
      end
    end
  end
end
