# frozen_string_literal: true

module Nii::Info
  class Time < Generic
    # @example
    #   context = Nii::Context.new 'de-CH', timezone: 'CET'
    #
    #   # create a new time in the context's timezone
    #   time = context.time 2012, 12, 20 # => 2012-12-20 00:00:00 +0100
    #   time.zone # => #<Nii::Timezone:"Zurich, Switzerland">
    #
    #   # convert a time to the context's timezone
    #   context.time Time.now
    #
    # @param args [Time, Array<Integer>]
    # @return [Time]
    # @see Nii::Timezone#local
    def local(*args) = zone.local(*args)
    alias_method :[], :local

    # @overload zone
    #   Same as {Nii::Context#timezone}.
    #   @return [Nii::Timezone]
    #   @see Nii::Context#timezone
    #
    # @overload zone(name)
    #   Resolves a timezone identifier for the current context.
    #
    #   @example
    #     context = Nii::Context.new "en-US"
    #     context.time.zone "ET" # => #<Nii::Timezone:"New York, United States">
    #
    #     context = Nii::Context.new "en-CA"
    #     context.time.zone "ET" # => #<Nii::Timezone:"Toronto, Canada">
    #
    #   @param name [String, Symbol, TZInfo::Timezone, ActiveSupport::Timezone, Nii::Timezone]
    #     The timezone identifier. See {Nii::Timezone.new} for a list of possible values.
    #
    #   @return [Nii::Timezone]
    def zone(name = nil) = name ? Nii::Timezone.new(name, territory, config) : context.timezone

    # @return [Nii::Timezone::Meta]
    # @see Nii::Timezone#meta_zone
    def meta_zone(name = nil) = zone(name).meta_zone
  end
end
