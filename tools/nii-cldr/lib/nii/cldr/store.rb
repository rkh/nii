# frozen_string_literal: true
require 'forwardable'

module Nii::CLDR
  class Store
    extend Forwardable
    def_delegators :data, :[], :[]=
    attr_reader :repository, :group, :directory, :name, :data, :optional_data

    def initialize(repository, group, directory, name)
      @repository, @group, @directory, @name = repository, group, directory, name
      @data, @optional_data = {}, { :@path => path }
      direct_parent # populate now
    end

    def path
      File.join(directory.to_s, name.to_s)
    end

    def apply(data)
      @data.merge!(data)
    end

    def clean
      return false if @clean ||= false
      return unless direct_parent
      direct_parent.clean
      @data  = clean_hash(data, direct_parent.full_data)
      @clean = true
    end

    def clean_hash(input, compare)
      return input unless input.is_a? Hash and compare.is_a? Hash
      return {} if input == compare
      input.map do |key, value|
        next nil if compare_value = compare[key] and value == compare_value
        value = clean_hash(value, compare_value) if value.is_a? Hash and compare_value.is_a? Hash
        [key, value] unless value == {}
      end.compact.to_h
    end

    def full_data
      return data unless parent
      merge = -> (_, old, new) { new.is_a?(Hash) && old.is_a?(Hash) ? old.merge(new, &merge) : new || old }
      parent.full_data.merge(data, &merge)
    end

    def direct_parent
      return if directory == '.' or directory.empty?
      @direct_parent ||= repository.store(group, File.dirname(directory), name)
    end

    def parent
      return unless direct_parent
      direct_parent.store? ? direct_parent : direct_parent.parent
    end

    def store?
      name == :info or data.any?
    end

    def write(path, compress)
      return unless store?

      file_name      = "#{name}.json"
      content        = generate_json(!compress)
      full_directory = File.expand_path(directory, path)
      FileUtils.mkdir_p(full_directory)

      if compress and compressed = Zlib.gzip(content, level: Zlib::BEST_COMPRESSION) and content.size - compressed.size > 5
        file_name += '.gz'
        content    = compressed
      end

      if name == :rbnf and !compress
        data.each do |key, value|
          next if key.start_with? '@' or !value.is_a?(String)
          File.write(File.join(full_directory, "#{key}.rbnf"), value)
        end
      end

      yield "#{File.basename(directory)}/#{file_name}" if block_given?
      File.write(File.join(full_directory, file_name), content)
    end

    def generate_json(pretty)
      data = optional_data.merge(self.data)
      data[:@parent] = parent.path if parent
      return data.to_json unless pretty
      JSON.neat_generate(data, wrap: 120, padding: 1, after_comma: 1, after_colon: 1, sort: true)
    end

    def inspect
      "#<#{self.class}:#{group}:#{directory}:#{name}>"
    end
  end
end
