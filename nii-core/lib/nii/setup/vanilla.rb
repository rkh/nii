# frozen_string_literal: true

module Nii::Setup
  # Setup scope when setup is invoked without an application argument.
  class Vanilla
    include Shared, Shared::Context, Shared::Conditional

    # @api internal
    attr_reader :application, :implicit_locales, :subsetups

    # @api internal
    def self.for?(application)
      application.nil?
    end

    # @api internal
    def self.setup(application, &block)
      instance = new(application)
      DSL.run(instance, &block)
      finalized = Finalized.new(instance)
      instance.finalize(finalized)
      finalized
    end

    # @api internal
    def initialize(application)
      unless self.class.for? application
        application = application.class unless application.is_a? Module
        raise ArgumentError, "cannot run #{self.class.inspect} for #{application.inspect}"
      end
      @application      = application
      @implicit_locales = []
      @subsetups        = {}
      super()
    end

    # @api setup
    # Allows replacing the backend for loading CLDR data.
    #
    # Primarily for internal purposes, like testing.
    # May be useful in the future if the CLDR data should be upgraded/downgraded separately.
    #
    # @example
    #   Nii::Setup.new do |config|
    #     config.data = Nii::Data.new "path/to/data"
    #   end
    #
    # @default Nii::DATA
    def data(value = Nii::UNDEFINED) = set(:data, value)

    # @api setup
    #
    # Limits the locales that are acceptable outcomes for locale negotiation.
    #
    # Sub-locales will still be accepted (ie, if `en` is in the list of available locales,
    # a client may still ask for `en-US`). This option is ignored if a locale is set explicitly.
    #
    # @example
    #   Nii::Setup.new do
    #     available_locales "de", "en"
    #   end
    def available_locales(*values)
      self[:available_locales] = Nii::LocalePreference.new(values) if values.any?
      self[:available_locales]
    end

    alias_method :locales, :available_locales

    # @api internal
    def finalize(finalized)
    end

    # @private
    def inspect
      return "#<#{self.class.inspect}>" unless @application
      app = @application.inspect
      app = "#<#{@application.class.inspect}>"if app.size > 100
      "#<#{self.class.inspect}:#{app}>"
    end

    private

    def base_setup
      self
    end

    def prepare_config
      @config[:available_locales] ||= Nii::LocalePreference.new(implicit_locales) if implicit_locales.any?
    end
  end
end
