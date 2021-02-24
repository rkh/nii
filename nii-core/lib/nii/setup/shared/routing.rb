# frozen_string_literal: true

module Nii::Setup::Shared
  module Routing
    include Paths

    # @api setup
    #
    # Allows for domain specific setup.
    # If patterns are used, multiple configurations may apply to a single domain (they are matched in definition order).
    #
    # @example
    #   Nii::Setup.new MyApp do
    #     # applies to all .de domains
    #     domain(/\.de$/) { locale "de-DE" }
    #
    #     # applies in addition to the block above
    #     domain("beispiel.de") { namespace "example" }
    #   end
    def domain(name)
      self[:domains]       ||= {}
      self[:domains][name] ||= {}
      RouteScope.new(self[:domains][name])
    end

    # @api setup
    #
    # Enables pattern matching for domain, locale_path, and ignore_path.
    # Valid options include String, Regexp, as well as Mustermann pattern classes.
    #
    # The class set as argument needs to implement `===` (returning true or false) and
    # `match` (returning a MatchData object).
    #
    # @example
    #   # Rails compatible route patterns
    #   require "mustermann/rails"
    #   Nii::Setup.new MyRailsApp do
    #     pattern_style Mustermann::Rails
    #     locale_path "/l/:locale/*path" # use /l/en instead of /en as locale prefix
    #     ignore_path "/assets/*path"    # ignore all requests to /assets/*
    #   end
    #
    #   # Sinatra compatible route patterns
    #   require "mustermann/sinatra"
    #   Nii::Setup.new MySinatraApp do
    #     pattern_style Mustermann::Sinatra
    #     domain("*.de") { locale "de-DE" } # pattern_style also applies to domain
    #   end
    #
    # @default String
    def pattern_style(value = Nii::UNDEFINED) = set(:pattern_style, value)

    # @api setup
    #
    # Sets or enables/disables the HTTP request header to use for locale negotiation.
    #
    # * false: disable header based locale negotiation.
    # * true or no value: enable header based locale negotiation with the default header (Accept-Language)
    # * A String: use an alternative header.
    #
    # Note that other locale determining settings (like locale_path or a fixed locale)
    # take precedence over the header value. 
    #
    # @example
    #   Nii::Setup.new MyAPI do
    #     # use the non-standard X-Language header instead
    #     language_header "X-Language"
    #   end
    #
    # @default true
    def language_header(value = true) = set(:language_header, value)

    # @api setup
    #
    # Sets or enables/disables the HTTP request header to use for timezone determination.
    #
    # * false: disable header based timezone determination.
    # * true or no value: enable header based timezone determination with the default header (Timezone, Time-Zone, or TZ)
    # * A String: use an alternative header.
    #
    # Note that browsers don't currently implement this feature, and the draft standard from 2011 hasn't gone
    # beyond the proposal stage.
    #
    # @example
    #   Nii::Setup.new MyAPI do
    #     # use the X-Timezone header
    #     timezone_header "X-Timezone"
    #   end
    #
    # @default true
    def timezone_header(value = true) = set(:timezone_header, value)

    # @api setup
    #
    # Sets or enables/disables the use of a timezone cookie.
    #
    # * false: disable cookie based timezone determination.
    # * true or no value: enable cookie based timezone determination with the default cookie name (tz and browser_time_zone)
    # * A String: use an alternative cookie name.
    #
    # Nii will not do anything server-site to set this cookie, but will happily use it to determine the timezone.
    # It is recommended to set this cookie via JavaScript.
    #
    # The simplest way to determine the timezone in JavaScript is via ECMAScript Intl:
    #
    #   var timezone = Intl.DateTimeFormat().resolvedOptions().timeZone;
    #
    # @example
    #   Nii::Setup.new MyAPI do
    #     # tell Nii to ignore any timezone cookie
    #     timezone_cookie false
    #   end
    #
    # @default true
    def timezone_cookie(value = true) = set(:timezone_cookie, value)

    # @api setup
    #
    # The Rack environment key to store the context instance under.
    # Changing this setting allows you to have more than one context per request.
    #
    # @default nii.context
    def env_key(value  = Nii::UNDEFINED) = set(:env_key,  value) || 'nii.context'

    # @api setup
    #
    # The Rack environment key to store the synchronization context under.
    # Used for synchronizing I18n.locale with the request's locale.
    #
    # @default nii.sync
    def sync_key(value = Nii::UNDEFINED) = set(:sync_key, value) || env_key =~ /^(.*)\.context$/ ? "#$1.sync" : 'nii.sync'
  end
end
