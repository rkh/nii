# frozen_string_literal: true

module Nii
  # A hybrid temporary (GC friendly) and permanent in-memory cache.
  # Primarily used to speed up locale logic operations (and thus locale negotiation).
  # @api internal
  class Cache
    attr_reader :default_mode, :default_block

    def initialize(default_mode = :weak, consistent: false, &default_block)
      @keys          = {}
      @temporary     = ObjectSpace::WeakMap.new
      @permanent     = {}
      @default_mode  = default_mode
      @default_block = default_block
      @lock          = consistent ? Concurrent::ReadWriteLock.new : Utils::DummyLock
    end

    def fetch(*key, cache: default_mode)
      return fetch(*key, cache: cache, &default_block) unless block_given? or default_block.nil?
      @permanent.fetch(key) do
        key   = cache_key(key)
        cache = cache.call(key) if cache.respond_to? :call
        @lock.with_read_lock do
          case cache
          when :strong then store(@permanent, key) { temporary[key] || yield }
          when :weak   then store(@temporary, key) { track(key, yield) }
          else raise ArgumentError, "unexpected value for cache: #{cache.inspect}"
          end
        end
      end
    end

    private

    def store(map, key)
      result = map[key]
      result ? result : @lock.with_write_lock { map[key] = yield }
    end

    def cache_key(key)
      id = @keys[key.hash]
      id == key ? id : key.dup
    end

    def track(key, object)
      @keys[key.hash] = key
      object, freeze  = object.dup, true if object.frozen?
      return object if object.frozen? # impossible to unfreeze (Integer, Symbol, etc)
      ObjectSpace.define_finalizer(object, finalizer(key.hash)) unless object.frozen?
      freeze ? object.freeze : object
    end

    def finalizer(hash) = proc { @keys.delete(hash) }
  end
end
