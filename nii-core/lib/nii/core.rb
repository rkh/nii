# frozen_string_literal: true

# Ruby Standard Library
require 'bigdecimal/util'
require 'forwardable'
require 'pathname'
require 'strscan'
require 'weakref'
require 'zlib'

# Gem Dependencies
require 'concurrent'
require 'tzinfo'

# Namespace for all Nii objects.
module Nii
  autoload :Bundle,             'nii/bundle'
  autoload :ConditionalConfig,  'nii/conditional_config'
  autoload :Cache,              'nii/cache'
  autoload :Config,             'nii/config'
  autoload :Context,            'nii/context'
  autoload :Currency,           'nii/currency'
  autoload :Data,               'nii/data'
  autoload :Date,               'nii/date'
  autoload :DayPeriod,          'nii/day_period'
  autoload :DecimalFormat,      'nii/decimal_format'
  autoload :Errors,             'nii/errors'
  autoload :Formats,            'nii/formats'
  autoload :Formatters,         'nii/formatters'
  autoload :Functions,          'nii/functions'
  autoload :Helpers,            'nii/helpers'
  autoload :HTMLString,         'nii/html_string'
  autoload :Info,               'nii/info'
  autoload :LoadPath,           'nii/load_path'
  autoload :LocalePreference,   'nii/locale_preference'
  autoload :LocaleMap,          'nii/locale_map'
  autoload :Locale,             'nii/locale'
  autoload :Localized,          'nii/localized'
  autoload :Lookup,             'nii/lookup'
  autoload :Message,            'nii/message'
  autoload :Middleware,         'nii/middleware'
  autoload :Parser,             'nii/parser'
  autoload :Plurals,            'nii/plurals'
  autoload :RackEnv,            'nii/rack_env'
  autoload :RBNF,               'nii/rbnf'
  autoload :Setup,              'nii/setup'
  autoload :Template,           'nii/template'
  autoload :Territory,          'nii/territory'
  autoload :TimePattern,        'nii/time_pattern'
  autoload :Timezone,           'nii/timezone'
  autoload :Utils,              'nii/utils'

  # Namespace for calendar systems. +nii-core+ only supports {Gregorian the gregorian calendar}.
  # More calendar systems are implemented by the +nii-calendars+ gem.
  module Calendar
    autoload :Generic,   'nii/calendar/generic'
    autoload :Gregorian, 'nii/calendar/gregorian'
  end

  # Namespace for numbering systems.
  # @api internal
  module NumberingSystem
    autoload :Algorithmic, 'nii/numbering_system/algorithmic'
    autoload :Generic,     'nii/numbering_system/generic'
    autoload :Numeric,     'nii/numbering_system/numeric'
  end

  # Namespace for message compilers.
  # @see Nii::Message#compile
  # @api internal
  module Compiler
    autoload :Fluent,    'nii/compiler/fluent'
    autoload :I18n,      'nii/compiler/i18n'
    autoload :Variables, 'nii/compiler/variables'
  end

  # Placeholder for methods that need to differentiate a default argument value from an explicit nil.
  # @api internal
  UNDEFINED = Object.new

  # @api internal
  def UNDEFINED.inspect = 'Nii::UNDEFINED'

  # Silence some expected warnings (this will only impact warnings triggered from files inside lib/nii).
  Utils::WarningFilter.ignore 'assigned but unused variable', 'unused literal' # from generated code (mainly plurals)
  Utils::WarningFilter.ignore 'character class has duplicated range'           # Mapping for EBNF grammers to Regexp
  Utils::WarningFilter.ignore 'duplicated and overwritten on line'             # Generated units code (todo: fix this)

  # Reusable instance of {Nii::Data}, already configured to load CLRD locale information.
  # Any {Nii::Context} will pick this up unless an alternative is provided.
  # Gems and libraries that provide additional locale information, such as nii-extra-locales will
  # add their data by appending a new data directory to {Nii::Data#load_path Nii::DATA.load_path}.
  # 
  # @api internal
  DATA = Data.new File.expand_path('../../data', __dir__)
  raise RuntimeError, 'could not find locate locale data' if DATA.known_locales.empty?

  # Handy for HTML escaping and such.
  # @api internal
  HTML = Info::Html.new

  # Shorthand for {Nii::Setup.new}.
  #
  # @example
  #   Nii.setup MyApp do
  #     available_locales "en", "fr"
  #   end
  def self.setup(...) = Setup.new(...)
  class << self
    alias_method :Setup, :setup
  end

  # Short-hand for creating a default configuration from a localization directory.
  #
  # @example
  #   context = Nii::Context.new "en", Nii["config/locales"]
  #
  # @see For more complex configurations, it is recommended to use Nii::Setup instead.
  # @return [Nii::Config]
  def self.[](*paths, **options) = Nii::Config.new(options).merge(lookup: Lookup.new(*paths, options))
end
