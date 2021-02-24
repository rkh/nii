# frozen_string_literal: true

module Nii::Setup
  class Finalized
    attr_reader :application, :config
    alias_method :to_nii_config, :config

    # Triggers eager loading for either the the given locales, or +config.available_locales+.
    # Does not eagerly load any locale data if neither is given (loading all possible locales
    # without any filter is not recommended).
    #
    # @note
    #   This method is only needed for copy-on-write friendly process forking. Use it in a
    #   pre-fork callback or something similar. In a single process or non-forking setup, calling
    #   +eager_load+ is not recommended, as data and template loading is designed with memory
    #   and time efficient lazy loading and highly concurrent setups in mind.
    #
    #   Calling this method will eagerly load all data for a given locale, as well as all Nii
    #   code (trigger every single autoload set up). This will likely result in a larger memory
    #   footprint then loading just the data that is needed. The smaller the subset of Nii you use,
    #   the more benefitial it is not to eager load anything, even in a multi-process setup.
    #
    #   You should therefore not blindly add a call to this method just because it feels right,
    #   but instead do actual benchmarks. Or just leave it be and not worry too much.
    #
    # @example
    #   setup = Nii.setup { locales :de, :en }
    #   setup.eager_load
    def eager_load(*locales)
      @lock.synchronized do
        if locales.empty?
          return if @eager_loaded
          locales = Array(config.available_locales)
        end

        config.data.eager_load(*locales) if locales.any?
        unless @eager_loaded
          eager_load_constants(Nii)
          config.lookup&.eager_load
        end

        @eager_loaded = true
      end
    end

    # @api internal
    def initialize(setup)
      @application  = setup.application
      @config       = setup.to_nii_config
      @subsetups    = setup.subsetups
      @lock         = Mutex.new
      @eager_loaded = false
      eager_load if @config.eager_load?
    end

    # @return [Finalized, nil]
    def [](key) = key == application ? self : @subsetups[key]

    # @private
    def inspect = "#<#{self.class}>"
    
    private

    def eager_load_constants(base)
      base.constants.each do |name|
        constant = base.const_get(name)
        eager_load_constants(constant) if constant.is_a? Module
      end
    end
  end
end
