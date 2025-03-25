# frozen_string_literal: true
require "set"

module Nii::I18n
  # @private
  class ArrayMonitor < BasicObject
    def initialize(array)
      @array     = array
      @paths     = ::Set.new
      @callbacks = []

      snapshot
    end

    def to_a = @flat
    alias_method :to_ary, :to_a
    alias_method :flatten, :to_a

    def each(...)   = @flat.each(...)
    def map(...)    = @flat.map(...)
    def select(...) = @flat.select(...)

    def callback(&block)
      @callbacks << block
      @flat.each(&block)
    end

    def method_missing(...)
      result = @array.public_send(...)
      if @dup != @array
        snapshot
        @flat.each do |path|
          next if @paths.include?(path)
          path.freeze
          @paths << path
          @callbacks.each { |c| c.call(path) }
        end
      end
      result
    end

    def respond_to_missing?(m, include_private)
      @array.respond_to?(m, include_private)
    end

    def is_a?(klass) = klass == ArrayMonitor or @array.is_a?(klass)

    private

    def snapshot
      @dup  = @array.dup.freeze
      @flat = @array.flatten.freeze
    end
  end
end
