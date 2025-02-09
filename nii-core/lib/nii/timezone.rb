# frozen_string_literal: true

module Nii
  # Nii's own timezone class. Instances can easily be created from and converted to TZInfo::Timezone
  # and ActiveSupport::TimeZone objects. It also implements common parts of their APIs, and can therefore
  # be used as a drop-in replacement in certain scenarios.
  #
  # The main purpose for this class is to ease localized formatting. Neither ActiveSupport, nor TZInfo have a full concept
  # of meta timezones, nor do they support BCP 47 extensions codes. This implementation makes sure the used timezone
  # objects are consistent with the CLDR data.
  #
  # == With Ruby's Time
  #
  # Nii::Timezone implements the interface expected by Ruby for the +tz+ or +in+ arguments, and can thus be passed
  # to Time instance methods:
  #
  #   Time.at 1618239635, in: Nii::Timezone['ET']
  #   # => 2021-04-12 10:59:37 -0400
  #
  #   time = Time.now.localtime Nii::Timezone['ET'] # convert the time to a timezone
  #   time.zone # => #<Nii::Timezone:"New York, United States">
  #
  #   # Or with a Nii::Context
  #   context = Nii::Context.new
  #   time    = Time.now.localtime context.timezone
  #
  # == Comparison and Compatiblity
  #
  #                           | Nii::Timezone              | TZInfo::Timezone        | ActiveSupport::TimeZone
  #   ------------------------|----------------------------|-------------------------|-------------------------
  #    Returns time as        | Time                       | TZInfo::TimeWithOffset  | ActiveSupport::TimeWithZone
  #    Supported Identifiers  | IANA, BCP 47, POSIX, Rails | IANA                    | IANA, Rails
  #    Nii::Timezone to class | (is identical)             | #to_tzinfo              | #to_active_support
  #
  # All three share the following API methods:
  # * {#name} (Nii's implementation behaves exactly like TZInfo and mostly like ActiveSupport)
  # * {#at}, {#now}, {#local_to_utc}, {#utc_to_local} – class of return value differs (see table above)
  # * {#utc_offset}
  # * {.all}
  #
  # In addition, Nii::Timezone and TZInfo::Timezone share the following API methods:
  # * {#local_time} – class of return value differs (see table above)
  # * {#abbreviation}/{#abbr}, {#dst?}, {#base_utc_offset}, {#observed_utc_offset}, {#identifier}
  # * {.get}, {.all_identifiers}
  #
  # In addition, Nii::Timezone and ActiveSupport::TimeZone share the following API methods:
  # * {#<=>} and all derived methods (TZInfo also implements this, but with different behavior)
  # * {#local} – class of return value differs (see table above)
  # * {#tzinfo}
  # * {.[]}, {.create}, {.new}
  class Timezone
    # A meta timezone. May resolve to different timezones depending on location.
    # @see Timezone#meta_zone
    class Meta
      # @param config [Nii::Config]
      # @return [Array<Nii::Timezone::Meta>] List of all known meta zones.
      def self.all(config = nil)
        config = Nii::Config.new(config)
        config.data.cache(:meta_zones) do
          list = config.data.timezone_data(:meta_zones)
          list.map { |code| new(code, data: config.data) }.freeze
        end
      end

      # Maps {.all} meta zones to the corresponding timezone for the given territory.
      # @param (see #for)
      # @param (see .all)
      # @return [Array<Nii::Timezone>] List of timezones
      def self.for(territory, config = nil) = all(config).map { |meta| meta.for(territory) }.uniq

      # @api internal
      def self._load(code) = new(name)

      # @api internal
      def _dump(level) = name

      include Comparable

      # @return [String]
      attr_reader :name
      alias_method :to_s, :name

      # @api internal
      def initialize(name, config = nil)
        @name, @config = name, Nii::Config.new(config)
      end

      # Compares two meta zones based on their name.
      # @return [-1, 0, 1, nil]
      def <=>(other) = other.is_a?(Meta) ? name <=> other.name : nil

      # Calculates a hash for object equality.
      # @return [Integer]
      def hash = other.hash

      # Checks if two Meta instances are equal to each other.
      # @return [true, false]
      def eql?(other) = other.is_a?(Meta) && name == other.name

      # Gets the specific timezone for this meta zone based on a location.
      # @param territory [Nii::Territory, String, Symbol]
      # @return [Nii::Timezone]
      def for(territory) = Timezone.new(self, territory, @config)

      # @private
      def inspect = "#<#{self.class.inspect}:#{name.inspect}>"
    end

    RAILS_MAPPING     = defined?(ActiveSupport::TimeZone) ? ActiveSupport::TimeZone::MAPPING : {}
    REVERSE_MAPPING   = RAILS_MAPPING.invert
    HEADER_DRAFT      = /\A(?:[^;]*;){2}(.*)\Z/m
    ANYWHERE_ON_EARTH = /^(?:aoe|anywhere|anywhere[ _]on[ _]earth)$/i
    private_constant :REVERSE_MAPPING, :RAILS_MAPPING, :HEADER_DRAFT, :ANYWHERE_ON_EARTH

    include Comparable
    extend Forwardable

    # @example From a String
    #   Nii::Timezone.new "Europe/Paris"           # => #<Nii::Timezone:"Paris, France">
    #   Nii::Timezone.new "America Eastern"        # => #<Nii::Timezone:"New York, United States">
    #   Nii::Timezone.new "America Eastern", "CA"  # => #<Nii::Timezone:"Toronto, Canada">
    #   Nii::Timezone.new "CET", "CH"              # => #<Nii::Timezone:"Zurich, Switzerland"> 
    #   Nii::Timezone.new "CST6CDT"                # => #<Nii::Timezone:"POSIX style time zone for US Central Time">
    #   Nii::Timezone.new "frpar"                  # => #<Nii::Timezone:"Paris, France">
    #
    # @example From an Integer
    #   Nii::Timezone[-5] # => #<Nii::Timezone:"5 hours ahead of UTC">
    #   Nii::Timezone[+5] # => #<Nii::Timezone:"5 hours behind UTC">
    #
    # @example With ActiveSupport::TimeZone
    #   # Time.zone is defined by ActiveSupport
    #   Time.zone = "Eastern Time (US & Canada)"
    #   Time.zone # => #<ActiveSupport::TimeZone:@name="Eastern Time (US & Canada)", @utc_offset=nil, @tzinfo=…>
    #
    #   tz = Nii::Timezone[Time.zone] # => #<Nii::Timezone:"New York, United States">
    #   tz.to_active_support          # => #<ActiveSupport::TimeZone:@name="Eastern Time (US & Canada)", @utc_offset=nil, @tzinfo=…>
    #
    #   # Nii::Timezone implements many methods in the same way as ActiveSupport::TimeZone.
    #   # Conversion back and forth might not always be necessary.
    #
    # @example With TZInfo
    #   # tzinfo is the defacto standard in Ruby for dealing with timezones
    #   tzinfo = TZInfo::Timezone.get "Europe/Paris" # => #<TZInfo::DataTimezone: Europe/Paris>
    #   tz     = Nii::Timezone[tzinfo]               # => #<Nii::Timezone:"Paris, France">
    #   tz.to_tzinfo                                 # => #<TZInfo::DataTimezone: Europe/Paris>
    #
    #   # Nii::Timezone implements many methods in the same way as TZInfo::Timezone.
    #   # Conversion back and forth might not always be necessary.
    #
    # @param (see .code_for)
    # @raise (see .code_for)
    # @return [Nii::Timezone]
    def self.new(identifier, territory = nil, config = nil, complain: true)
      return identifier.to_nii_timezone if identifier.respond_to? :to_nii_timezone
      config = Nii::Config.new(config)
      return unless code = code_for(identifier, territory, config, complain: complain)
      config.data.cache(:timezone, code: code) { super(code, data: config.data) }
    end

    class << self
      alias_method :get,           :new
      alias_method :create,        :new
      alias_method :[],            :new
      alias_method :find_timezone, :new
    end

    # List of all BCP 47 timezone codes.
    # @param config [Nii::Config]
    # @return [Array<String>]
    def self.codes(config = nil) = Nii::Config.new(config).data.timezone_data(:timezones).keys
    class << self
      alias_method :bcp47, :codes
    end


    # List of all accepted aliases.
    # @param config [Nii::Config]
    # @return [Array<String>]
    def self.aliases(config = nil)
      config  = Nii::Config.new(config)
      aliases = config.data.timezone_data(:aliases).keys + codes(config)
      aliases.sort
    end

    class << self
      alias_method :all_identifiers, :aliases
    end

    # List of all known timezones.
    # @param config [Nii::Config]
    # @return [Array<Timezone>]
    def self.all(config = nil)
      config = Nii::Config.new(config)
      config.data.cache(:timezones) { codes(config).map { |code| new(code, nil, config) }.freeze }
    end

    # The server timezone.
    #
    # @note
    #   Keep in mind that this is the server's timezone. For localizing timezones, you likely want to use
    #   {Nii::Context#timezone} instead (which will default to Timezone.current).
    #
    # @return Nii::Timezone
    def self.current(config = nil)
      id   = config&.timezone
      id ||= ENV['TZ'] || Time.now.zone
      new(id, config&.territory, config)
    end

    class << self
      alias_method :local, :current
    end

    # Convenience method for setting the global timezone.
    # Not actually used by Nii internally.
    #
    # @note
    #   This method is not thread-safe.
    #   It is intended for testing, IRB sessions or while loading and setting up an application,
    #   not for a per-request, concurrent usage.
    #
    # @example
    #   Nii::Timezone.current = 'ET'
    #   Time.at 1_000_000_000 # => 2001-09-08 21:46:40 -0400
    #
    #   Nii::Timezone.current = 'CET'
    #   Time.at 1_000_000_000 # => 2001-09-09 03:46:40 +0200
    #
    # @param value [Object]
    #   
    def self.current=(value)
      timezone          = new(value).to_iana
      Time.zone         = timezone if Time.respond_to? :zone=
      Time.zone_default = timezone if Time.respond_to? :zone_default=
      ENV['TZ']         = timezone
    end

    # @overload code_for(identifier, territory = nil, config = nil)
    #
    # @example
    #   Nii::Timezone.code_for "Europe/Paris" # => "frpar"
    #
    # @param identifier [String, Symbol, TZInfo::Timezone, ActiveSupport::Timezone, Nii::Timezone, Time]
    #   Object identifying the timezone. Can be one of the following:
    #   * TZInfo timezone object (example: +TZInfo::Timezone.get("Europe/Paris")+).
    #   * Rails/ActiveSupport timezone object (example: +Time.zone+) – only availabe if ActiveSupport has been loaded.
    #   * Rails/ActiveSupport timezone alias (example: +"International Date Line West"+) – only availabe if ActiveSupport has been loaded.
    #   * IANA timezone identifier (example: +"Europe/Paris"+) – spaces instead of underscores are accepted.
    #   * Unicode metazone or alias identifier (example: +:America_Eastern+, +"US/Eastern"+) – spaces instead of underscores are accepted.
    #   * English language abbreviation (example: +:CET+).
    #   * POSIX style timezone identifier (example: +:CST6CDT+).
    #   * BCP 47 timezone extension identifier (example: +:frpar+).
    #   * A String conforming with the draft proposal for the HTTP Timezone header (everything but the timezone names will be ignored).
    #   * An offset in hours, as Integer (example: +-5+).
    #   * A Time object, in which case it will return time's timezone as a Timezone (example: +Time.now+).
    #   You can call {.aliases} if you wish to see the full list.
    #
    # @param territory [Nii::Territory, String, Symbol, nil]
    #   Territory or territory code to resolve territory specific aliases.
    #   For example, "CET" will resolve to +Europe/Paris+ for France, but to +Europe/Zurich+ for Switzerland.
    #
    # @raise [Errors::UnknownTimezone] if the timezone identifier is unknown
    # @raise [TypeError] if the timezone identifier class is unsupported
    # @return [String]
    def self.code_for(identifier, territory = nil, config = nil, aliases = nil, complain: true)
      return identifier.to_nii_timezone.code if identifier.respond_to? :to_nii_timezone
      territory = territory.code if territory.respond_to? :code
      territory = Utils.string(territory || Territory::WORLD_CODE).upcase
      aliases ||= Nii::Config.new(config).data.timezone_data(:aliases)
      case identifier
      when *codes(config)      then identifier
      when *RAILS_MAPPING.keys then code_for(RAILS_MAPPING[identifier],  territory, config, aliases)
      when *aliases.keys       then code_for(aliases[identifier],        territory, config, aliases)
      when nil                 then code_for(primary(territory, config), territory, config, aliases)
      when 0                   then code_for('Etc/GMT',                  territory, config, aliases)
      when 1..12               then code_for("Etc/GMT+#{identifier}",    territory, config, aliases)
      when -14..-1             then code_for("Etc/GMT#{identifier}",     territory, config, aliases)
      when Symbol              then code_for(identifier.name,            territory, config, aliases)
      when Time                then code_for(identifier.zone,            territory, config, aliases)
      when Meta                then code_for(identifier.name,            territory, config, aliases)
      when ANYWHERE_ON_EARTH   then code_for('Etc/GMT+12',               territory, config, aliases)
      when Hash                then identifier.fetch(territory) { identifier.fetch(Territory::WORLD_CODE) }
      when String
        identifier[HEADER_DRAFT, 1]&.split(',')&.each do |name|
          result = code_for(name.strip, territory, config, aliases, complain: false)
          return result if result
        end
        raise Errors::UnknownTimezone, "unknown timezone: #{identifier.inspect}" if complain
      else
        if identifier.respond_to? :local_to_utc and identifier.respond_to? :utc_to_local
          # this object implements Ruby's timezone protocol
          name   = identifier.name if identifier.respond_to? :name
          name ||= identifier.abbr if identifier.respond_to? :abbr
          name ||= Utils.string(identifier)
          code_for(name, territory, config, aliases)
        elsif complain
          raise TypeError, "cannot convert #{identifier.class} to #{self}"
        end
      end
    end

    # @api internal
    # @return [String]
    def self.primary(territory, config, complain: true)
      territory   = territory.code if territory.respond_to? :code
      territory ||= Territory::WORLD_CODE
      Nii::Config.new(config).data.timezone_data(:primary).fetch(territory) do
        raise Errors::UnknownTimezone, "no primary timezone for #{territory}" if complain
      end
    end

    # Generates a time object equivalent to the given time object, but makes sure #zone returns a {Nii::Timezone}.
    # @example
    #   time = Time.utc 1998, 3, 31
    #   time.zone # => "UTC"
    #
    #   time = Nii::Timezone.set(time)
    #   time.zone # => #<Nii::Timezone:"UTC (Coordinated Universal Time)">
    #
    # @param time [Time, #to_time]
    # @param config [Nii::Config]
    # @return [Time]
    def self.set(time, config = nil)
      return time if time.is_a? Time and time.zone.is_a? self
      time.to_time.localtime(new(time.zone, config))
    end

    # @api internal
    def self._load(code) = new(code)

    # @api internal
    def _dump(level) = code

    # @api internal
    # @see .new
    def initialize(code, config)
      @code   = code
      @config = Nii::Config.new(config)
      @data   = @config.data.timezone_data(:timezones, code)
    end

    # @!method abbr(time = Time.now)
    #   Alias for {#abbreviation}.
    #
    # @!method abbreviation(time = Time.now)
    #   @note
    #     This method is only added for TZInfo compatibility. Abbrevations may differ by
    #     language and region, which this method does not account for, and the result of this
    #     method should therefore not be exposed to the end user.
    #   @param time [Time] Time used to determine the abbrevation (most commonly to determine DST).
    #   @return [String] English abbrevation for the timezone at the given time.
    #
    # @!method dst?(time = Time.now)
    #   @param time [Time] Time used to determine DST.
    #   @return [true, false] Whether or not daylight savings is in effect at the given time.
    #
    # @!method utc_offset(time = Time.now)
    #   Returns the offset of this timezone from UTC.
    #   Optionally takes a time argument, as the offset may change.
    #   This offset is usually adjusted for daylight savings (based on the given time parameter).
    #
    #   @param time [Time]
    #   @return [Interger] Offset in seconds
    #
    # @!method base_utc_offset(time = Time.now)
    #   Returns the base offset of this timezone from UTC.
    #   Attempts to not include offset for daylight savings, but if that is correct depends on
    #   the available timezone data. Install and use the tzinfo-data gem if you need this
    #   behavior guaranteed.
    #
    #   @param time [Time]
    #   @return [Interger] Offset in seconds
    #
    # @!method observed_utc_offset(time = Time.now)
    #   Returns the base offset of this timezone from UTC.
    #   Attempts to include offset for daylight savings, but if that is correct depends on
    #   the available timezone data. Install and use the tzinfo-data gem if you need this
    #   behavior guaranteed.
    #
    #   @param time [Time]
    #   @return [Interger] Offset in seconds
    def_delegators :to_tzinfo, :abbreviation, :abbr, :dst?, :utc_offset, :base_utc_offset, :observed_utc_offset
    
    # @api internal
    # To be even more of a TZInfo look-alike (so ActiveSupport's Time patches accept us as a TZInfo stand-in).
    def_delegators :to_tzinfo, :current_period, :offsets_up_to, :period_for, :period_for_local, :periods_for_local, :period_for_utc

    # Like Time#at, but with the time converted to local time in the timezone.
    #
    # @overload at(seconds)
    #   @param seconds [Numeric] Unix timestamp, with fraction
    #
    # @overload at(seconds, microseconds)
    #   @param seconds      [Numeric] Unix timestamp
    #   @param microseconds [Numeric] Microseconds, with fraction
    #
    # @overload at(seconds, subunit, scale)
    #   @param seconds [Numeric] Unix timestamp
    #   @param subunit [Numeric] Sub unit
    #   @param scale   [Symbol]  Scale of the sub unit.
    #     Possible values: +millisecond+, +usec+, +microsecond+, +nsec+, +nanosecond+.
    #
    # @return [Time] Time object with #zone returning this Nii:Timezone
    def at(*args) = Time.at(*args, in: self)
  
    # Like Time#now, but with the time converted to local time in the timezone.
    # @return [Time] The current time in the timezone.
    def now = Time.now.localtime(self)

    # @overload local(time = Time.now)
    #   @example
    #     Nii::Timeszone['PT'].local Time.now
    #
    #   @param time [Time] time to convert to the timezone
    #
    # @overload local(year, month = nil, day = nil, hour = nil, minute = nil, second = nil)
    #   @example
    #     Nii::Timezone['PT'].local 2019, 12, 31 # => 2019-12-31 00:00:00 -0800
    #
    #   @param year   [Integer]
    #   @param month  [Integer] 1 to 12
    #   @param day    [Integer] 1 to 31
    #   @param hour   [Integer] 0 to 23
    #   @param minute [Integer] 0 to 59
    #
    # @return [Time] Time object with #zone returning this Nii::Timezone
    def local(*args)
      case args
      in [              ]                then now
      in [ Time => time ]                then time.localtime(self)
      in [ Integer, *   ]                then Time.new(*args.values_at(*0..5), self)
      in [ t ] if t.respond_to? :to_time then t.to_time.localtime(self)
      in [ arg, * ]                      then raise ArgumentError, "#{arg.class.inspect} values are not supported"
      end
    end

    alias_method :local_time, :local
    alias_method :to_local,   :local

    # Implements Ruby's timezone API.
    # @param time Time-like object treated as if it is in the timezone (ignoring any possible timezone information)
    # @return [Time] time adjusted to UTC by the correct offset
    # @api internal
    def local_to_utc(time) = parse_utc(tzinfo.local_to_utc(time, &:last))

    # Implements Ruby's timezone API.
    # @param time Time-like object treated as if it is in UTC (ignoring any possible timezone information)
    # @return [Time] time adjusted to the timezone by the correct offset
    # @api internal
    def utc_to_local(time)
      time = parse_utc(time)
      time.getlocal(observed_utc_offset(time))
    end

    # @return [String] short timezone description (in English), typically in the format of "City, Country".
    # @note
    #   This is meant for development information only and is not localized. Use {Nii::Context#format} for
    #   any user facing content.
    def description = @data['description']
    alias_method :to_s, :description

    # @example Using a meta zone to map to a more fitting timezone
    #   tz = Nii::Timezone.new "ET"  # => #<Nii::Timezone:"New York, United States">
    #   mz = tz.meta_zone            # => #<Nii::Timezone::Meta:"America_Eastern">
    #   mz.for 'CA'                  # => #<Nii::Timezone:"Toronto, Canada">
    #
    # @example Taking timezone changes into account
    #   tz   = Nii::Timezone.new "America/Indiana/Petersburg"
    #   time = Time.parse "2006-12-12"
    #
    #   tz.meta_zone       # => #<Nii::Timezone::Meta:"America_Eastern">
    #   tz.meta_zone time  # => #<Nii::Timezone::Meta:"America_Central">
    #
    # @param time [Time, nil] optional point in time to use to determine the meta zone
    # @return [Meta] The timezone's CLDR meta zone.
    def meta_zone(time = nil)
      return @meta_zone ||= Meta.new(@data['meta']) unless time and @data.include? 'meta_history'
      @meta_history ||= @data['meta_history'].map { |e| [ parse_utc(e['from']), parse_utc(e['to']), Meta.new(e['meta']) ] }
      @meta_history.detect { |from, to, _| from.nil? || from <= time and to.nil? || to > time  }&.last || meta_zone
    end

    # Sorting logic compatible with what Rails does.
    # @param other [Nii::Timezone, ActiveSupport::Timezone, Object]
    # @return [-1, 0, 1, nil]
    def <=>(other)
      return unless other.respond_to? :utc_offset and other.respond_to? :name
      [ utc_offset, name ] <=> [ other.utc_offset, other.name ]
    end

    # Checks whether the other object is equivalent to the timezone.
    # @param other [Nii::Timezone, TZInfo::Timezone, ActiveSupport::TimeZone]
    # @return [true, false]
    def ===(other)
      return false if     other.is_a? String or other.is_a? Symbol
      return false unless code = Nii::Timezone.code_for(other, nil, @config, complain: false)
      code == @code or Nii::Timezone.new(code, nil, @config).meta_zone == meta_zone
    end

    # Allows pattern matching on the IANA code.
    #
    # @example
    #   tz = Nii::Timezone["frpar"]
    #   tz in Nii::Timezone(/^Europe/) # => true
    #
    # @return [Array<String>] one element array including the IANA code.
    def deconstruct = [name]

    # Allows pattern matching on +bcp47+, +code+, +iana+, +name+, and +meta_zone+.
    # All values are strings (thus you can string match directly on +meta_zone+).
    #
    # @example
    #   case tz = Nii::Timezone["Europe/Paris"]
    #   in Nii::Timezone(meta_zone: "Europe_Central", name: name)
    #     puts "#{name} is part of the Central European Time."
    #   end
    #
    # @param keys [nil, Array<Symbol>]
    # @return [Hash{Symbol: String}]
    def deconstruct_keys(keys)
      @deconstruct_keys ||= {
        bcp47: code, code: code, iana: to_iana,
        name: to_iana, meta_zone: meta_zone
      }.transform_values { _1&.to_s }.freeze
    end

    # @note
    #   IANA recommends that you don't display this identifier to inexperienced users (ie, it should be alright to
    #   expose it to developers working with timezones, but not to users unfamiliar with IANA). In fact, they
    #   recommend you use the CLDR to display friendly descriptions, which is exactly what you can do with
    #   {Nii::Context#format}.
    #
    # @return [String] corresponding IANA code.
    # @see https://data.iana.org/time-zones/theory.html Theory and pragmatics of the tz code and data
    def to_iana = @data['iana']
    alias_method :name,       :to_iana
    alias_method :identifier, :to_iana

    # @return [String] corresponding BCP 47 code.
    def to_bcp47 = @code
    alias_method :code, :to_bcp47

    # @return [TZInfo::Timezone] The corresponding tzinfo object.
    def to_tzinfo = @tzinfo ||= TZInfo::Timezone.get(name)
    alias_method :tzinfo, :to_tzinfo

    # @note Only available when ActiveSupport has been loaded. You can check +respond_to?+ if you aren't certain.
    # @return [ActiveSupport::Timezone]
    def to_active_support = ActiveSupport::TimeZone[REVERSE_MAPPING.fetch(name, name)] if defined? ActiveSupport::TimeZone

    # Generates a locale representation for the currency, with no timezone.
    #
    # This means that most methods that expect a locale as an argument will happily accept
    # a timezone instead.
    #
    # @example
    #   Nii::Timezone["Europe/Berlin"].to_nii_locale # => Nii::Locale["und-u-tz-deber"]
    #
    #   locale = Nii::Locale.parse "en-US"
    #   locale & Nii::Timezone["America/New York"] # => Nii::Locale["en-US-u-tz-usnyc"]
    #
    # @return [Nii::Locale] Locale representation of the timezone.
    def to_nii_locale = @locale ||= Nii::Locale.new(timezone: code)

    # @return [self]
    def to_nii_timezone = self

    # @private
    def inspect = "#<#{self.class.inspect}:#{description.inspect}>"

    private

    # Parse time as UTC time string (as opposed to whatever the local timezone is).
    # If the input string includes timezone information, then Ruby will just ignore the UTC suffix.
    #
    # @param input [String, nil]
    # @return [Time, nil]
    def parse_utc(input)
      return input if input.class == Time and input.utc?
      input = input.to_str if input.respond_to? :to_str
      case input
      when nil    then input
      when String then Time.parse("#{input} UTC")
      else
        fraction = input.respond_to?(:sec_fraction) ? input.sec_fraction * 1_000_000 : 0
        Time.utc(input.year, input.month, input.day, input.hour, input.min, input.sec, fraction)
      end
    end
  end
end
