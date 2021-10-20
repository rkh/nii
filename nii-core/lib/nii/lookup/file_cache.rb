# frozen_string_literal: true

module Nii::Lookup
  # @api internal
  class FileCache
    def initialize(load_path, pattern = nil, files: nil, reload_wait: 5, &callback)
      @load_path        = load_path
      @pattern          = pattern
      @callback         = callback
      @lock             = Concurrent::ReadWriteLock.new
      @time             = Time.at(0)
      @files            = nil
      @additional_files = Array(files).map { |f| Pathname.new(f) }
      @reload_wait      = reload_wait
      reload
    end

    def result
      @lock.with_read_lock { @result }
    end

    def reload
      @lock.with_read_lock { return if @time > Time.now - @reload_wait }
      @lock.with_write_lock do
        files  = []
        files += @load_path.glob(@pattern) if @pattern
        files += @additional_files.select { |f| f.exist? }
        files.uniq!
        files.sort!

        if files != @files or files.any? { |f| f.mtime >= @time }
          @time   = Time.now
          @files  = files
          @result = @callback.call(files)
        end
      end
    end
  end
end
