# frozen_string_literal: true

module Nii::Lookup
  # @abstract Superclass for file system based {Nii::Lookup::Common lookup} implementations.
  #   Any subclass will have to implement the private methods {#glob_pattern_for} and {#scan_locales}.
  #
  # @example Custom File System lookup
  #   # looks for files in the pattern of namespace/locale.format
  #   class MyLookup < Nii::Lookup::FileSystem
  #     def glob_pattern_for(locale, namespace)
  #       "#{namespace}/#{locale}.{#{formats.keys.join(',')}}"
  #     end
  #
  #     def scan_locales
  #       pattern = glob_pattern_for('*', '**')
  #       load_path.glob(pattern).map(&:basename).uniq
  #     end
  #
  #     private :glob_pattern_for, :scan_locales
  #   end
  #
  #   # try it out - will look in ./locales/world/en.* for a message called hello
  #   context = Nii::Context.new('en') { |c| c.lookup = MyLookup.new(path: './locales') }
  #   puts context.render(:hello, namespace: :world)
  class FileSystem < Common
    # @private
    def self.setup_class = Nii::Setup::Lookup::FileSystem

    attr_reader :load_path, :formats

    # @private
    def inspect
      "#<#{self.class}:#{load_path.to_a.inspect}>"
    end

    # Adds a path to the message lookup.
    # @param (see Nii::LoadPath#<<)
    # @return self
    def <<(source)
      load_path << source
      self
    end

    private

    def setup
      @formats   = setup_formats(@config.formats) || default_formats
      @load_path = Nii::LoadPath.new { |path| path_added(path) }
      Array(@config.path).each { |path| load_path << path }
    end

    def setup_formats(value, nested = false)
      raise Nii::Errors::SetupError, "unexpected format setting: #{value.inspect}" if nested and value.is_a? Enumerable
      case value
      when Hash       then value.transform_values { |v| setup_formats(v, true) }
      when String     then nested ? default_formats.fetch(value) : { value => default_formats.fetch(value) }
      when Symbol     then setup_formats(value.name, nested)
      when Array      then value.inject({}) { |h, e| h.merge! setup_formats(e).to_h }
      when false, nil then nil
      else raise Nii::Errors::SetupError, "unexpected format setting: #{value.inspect}"
      end
    end

    def default_formats
      @default_formats ||= Nii::Formats.all(format_config)
    end

    def format_config
      @config
    end

    def load_namespace(locale, namespace)
      return unless pattern = glob_pattern_for(locale, namespace) or config.files&.any?
      FileCache.new(load_path, pattern, files: config.files) do |files|
        bundle = Nii::Bundle.new(locale, namespace)
        files.each do |file|
          ext     = file.extname[1..-1]
          format  = formats.fetch(ext) { raise Nii::Errors::ParseError, "unknown format: #{ext.inspect}" }
          options = format.single_message? ? { name: file.basename(file.extname).to_s } : {}
          format.compile(bundle, file.read, **options)
        end
        bundle
      end
    end
 
    def lookup(file_cache, message)
      file_cache.reload if config.reload_templates?
      file_cache.result.find(message)
    end

    def glob_pattern_for(locale, namespace)
      raise NotImplementedError, 'subclass responsibility'
    end

    def path_added(path)
      reset
    end
  end
end
