# frozen_string_literal: true

module Nii
  # An ordered list of directories to look up files in.
  # Is thread-safe, does not allow removing paths again.
  #
  # Paths can be added to the beginning of the list via {#prepend}, {#push}, and {#unshift},
  # or the end of the list via {#<<}, {#append}, and {#concat}.
  #
  # @example
  #   load_path = Nii::LoadPath.new do |path|
  #     puts "Path added: #{path}"
  #   end
  #
  #   load_path << "config/locale"
  class LoadPath
    # Pathname subclass that keeps track of the base directory it's relative to.
    #
    # @example
    #   load_path = Nii::LoadPath.new "/etc/example", "~/example"
    #   file      = load_path.glob("*/*.yml").first # would find /etc/example/foo/bar.yml
    #
    #   file.to_s               # => "/etc/example/foo/bar.yml"
    #   file.base_path.to_s     # => "/etc/example"
    #   file.relative_path.to_s # => "foo/bar.yml"
    class Pathname < ::Pathname
      # @return [Pathname, nil] base path (usually corresponds to a load path entry)
      attr_reader :base_path

      # @return [Pathname, self] path relative to the base path (if present)
      attr_reader :relative_path

      # @api internal
      def initialize(path, base_path = nil)
        super(path)
        @base_path     = ::Pathname.new(base_path) if base_path
        @relative_path = base_path ? relative_path_from(base_path) : self
      end

      # Same as ::Pathname#glob, but results are converted to LoadPath::Pathname instances.
      def glob(*args)
        return super(*args) { yield subpath(_1) } if block_given?
        super(*args).map { subpath(_1) }
      end

      # Same as ::Pathname#join, but results are converted to LoadPath::Pathname instances.
      def join(*args) = args.empty? ? self : subpath(super)

      private

      def subpath(path) = self.class.new(path, base_path || self)
    end

    # Adds the given path to the end of the list.
    # @param path [String, Pathname]
    # @return [self]
    def <<(path) = add(path, position: :last)

    # Adds the given paths to the end of the list.
    # @param paths [String, Pathname, Array<String, Pathname>]
    # @return [self]
    def append(*paths) = add(paths, position: :last)
    
    # Adds the given paths to the end of the list.
    # @param paths [String, Pathname, Array<String, Pathname>]
    # @return [self]
    def concat(*paths) = add(paths, position: :last)

    # Adds the given paths to the beginning of the list.
    # @param paths [String, Pathname, Array<String, Pathname>]
    # @return [self]
    def prepend(*paths) = add(paths, position: :first)

    # Adds the given paths to the end of the list.
    # @param paths [String, Pathname, Array<String, Pathname>]
    # @return [self]
    def push(*paths) = add(paths, position: :last)

    # Adds the given paths to the beginning of the list.
    # @param paths [String, Pathname, Array<String, Pathname>]
    # @return [self]
    def unshift(*paths) = add(paths, position: :first)
    
    # Converts the path list into an array.
    # @return [Array<Pathname>]
    def to_a = @paths.dup

    # @return [Array<String>]
    def deconstruct = @paths.map(&:to_s)
  
    # @param paths [Array<String, Pathname>] List of paths.
    # @yield [path] Callback for when a path is added.
    #  The load path instance will block while the callback is executed.
    # @yieldparam [Pathname] path The path that was added.
    def initialize(*paths, &callback)
      @callback = callback
      @lock     = Concurrent::ReadWriteLock.new
      @paths    = []
      add(paths)
    end

    # Shorthand for reading a JSON file. Will automatically add the .json file extension.
    # @example
    #   load_path.json :info # will look for info.json and info.json.gz
    # @param (see #has_file?)
    # @option (see #read)
    # @return (see #read)
    # @see #read
    def json(*files, **options, &block) = read(*files, parse: :json, ext: '.json', **options, &block)
  
    # Shorthand for reading a YAML file. Will automatically add the .yml and .yaml file extension.
    # @example
    #   load_path.json :info # will look for info.yml, info.yaml, info.yml.gz and info.yaml.gz
    # @param (see #has_file?)
    # @option (see #read)
    # @return (see #read)
    # @see #read
    def yaml(*files, **options, &block) = read(*files, parse: :yaml, ext: ['.yml', '.yaml'], **options, &block)
  
    # Reads the first file found.
    #
    # @example
    #   load_path = LoadPath.new("example", "another_example")
    #   path = load_path.read("example.yml", "example.yaml", parse: :yaml, directory: "example")
    #   # will check, in order:
    #   #   example/example/example.yml
    #   #   example/example/example.yml.gz
    #   #   example/example/example.yaml
    #   #   example/example/example.yaml.gz
    #   #   another_example/example/example.yml
    #   #   another_example/example/example.yml.gz
    #   #   another_example/example/example.yaml
    #   #   another_example/example/example.yaml.gz
    #   # and return the parsed contents of the first one that exists
    #
    # @param (see #has_file?)
    # @param parse [Symbol, nil] Format to parse content as (examples: +json+, +yaml+, +fluent+, +gettext+, +properties+).
    # @option (see #lookup)
    #
    # @yield [content] Block called with the possibly parsed content if the file has been found.
    # @return [nil, Object] +nil+ if no file has been found, the return value of the block if one has been given,
    #   the parsed contents of the file otherwise.
    def read(*files, ext: nil, gz: true, parse: nil, **options)
      return unless file = lookup(*file_names(files, ext: ext, gz: gz), **options)
      result = file.extname == '.gz' ? Zlib::GzipReader.open(file, &:read) : file.read
      result = Nii::Parser.public_send(parse, result) if parse
      block_given? ? yield(result) : result
    end

    # Generates possible file names.
    # @api internal
    def file_names(*files, ext: nil, gz: true)
      ext &&= Array(ext)
      files.flatten!
      files = files.flat_map { |f| Symbol === f ? ext.map { |e| "#{f}#{e}" } : Utils.string(f) } if ext and ext.any?
      files = files.flat_map { |f| File.extname(f) == '.gz' ? f : [f, "#{f}.gz"] } if gz
      files
    end

    # Checks if a file exists within the paths.
    # @param files [Array<String, Pathname>] List of possible file names.
    # @param ext [String, Array<String>] List of possible file extensions.
    # @param gz [true, false] whether to also look fo gzip-compressed versions of the file.
    # @option (see #lookup)
    def has_file?(*files, ext: nil, gz: true, **options)
      possible_paths(*file_names(files, ext: ext, gz: gz), **options).any? { |p| p.exist? }
    end

    # Returns or yields the first existing path for a list of given file names.
    #
    # @example
    #   load_path = LoadPath.new("example", "another_example")
    #   path = load_path.lookup("example.yml", "example.yaml", directory: "example")
    #   # will check, in order:
    #   #   example/example/example.yml
    #   #   example/example/example.yaml
    #   #   another_example/example/example.yml
    #   #   another_example/example/example.yaml
    #   # and return the first one that exists
    #
    # @param files [Array<String, Pathname>] List of possible file names.
    # @option options [String, Pathname] directory Directory to check for within the paths.
    # @option options [String, Pathname] path Overrides the path to use for lookup. Handy for use within the path added callback.
    # @option options [Array<String, Pathname>] paths Same as +path+, but accepts a list of paths.
    # @yield [path] Block to be called if the file has been found (optional).
    # @yieldparam path [Pathname] Path of the found file.
    # @return [Pathname, Object, nil] +nil+ if no file has been found;
    #   the return value of the block, if a block has been given, the path of the found file otherwise.
    def lookup(*files, **options)
      result = possible_paths(*files, **options).detect { |file| file.exist? }
      block_given? ? yield(result) : result if result
    end

    # Looks for files within the paths matching a given Unix glob pattern.
    #
    # @overload glob(pattern, &block)
    #   @param pattern [String] Unix glob pattern to scan paths for.
    #   @yield [path] Block called for every matching file found.
    #   @yieldparam [Pathname] path
    #   @return [nil]
    #
    # @overload glob(pattern)
    #   @param pattern [String] Unix glob pattern to scan paths for.
    #   @return [Array<Pathname>]
    def glob(pattern, &block)
      result = @lock.with_read_lock { @paths.flat_map { |path| path.glob(pattern, &block) }}
      result unless block
    end

    # List of all possible paths for a file, whether they exist or not.
    #
    # @param files [Array<String, Pathname>] possible file names
    # @param paths [Array<String, Pathname>, nil] paths to look in for the file
    # @param directory [String, Pathname] directory to prefix the file path with
    # @return [Array<Pathname>]
    # @api internal
    def possible_paths(*files, paths: nil, path: nil, directory: nil)
      paths = Array(path) if path
      if paths.nil? or paths.empty?
        @lock.with_read_lock { possible_paths(*files, paths: @paths, directory: directory) }
      else
        paths.flat_map do |path|
          path = path.join(directory) if directory
          files.flat_map { |file| path.join(file) }
        end
      end
    end

    # @private
    def inspect
      "#<#{self.class.inspect}:#{@paths.map(&:to_s).inspect}>"
    end

    private

    def add(*paths, position: :last)
      @lock.with_write_lock do
        paths = paths.flatten
        paths = paths.flat_map { _1.respond_to?(:to_a) ? _1.to_a : _1 }
        paths.map! { Nii::Utils.string(_1.respond_to?(:to_path) ? _1.to_path : _1) }

        paths.each do |path|
          path = Pathname.new(path).expand_path
          next if @paths.include? path

          @callback.call(path) if @callback

          case position
          when :first then @paths.unshift(path)
          when :last  then @paths.push(path)
          else raise ArgumentError, "invalid position: #{poisiton.inspect}"
          end
        end
      end
      self
    end
  end
end
