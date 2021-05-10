# frozen_string_literal: true

module Nii
  module Helpers
    # @example
    #   class MyClass
    #     # use Nii::Helpers but reuse the shared context from the nii-global gem
    #     include Nii::Helpers[Nii::Global]
    #
    #     def example
    #       localize Time.now # will be handed off to Nii::Global
    #     end
    #   end
    def self.[](context)
      definition = context
      definition = -> { context.to_nii_context } if context.respond_to? :to_nii_context
      helpers    = self
      Module.new { include helpers; define_method(:nii, &definition) }
    end

    # @overload nii
    # @return [Nii::Context]
    # @raise [Nii::Errors::SetupError] if localization context cannot be determined
    def nii(complain = true)
      case
      when defined?(@nii) && @nii           then @nii
      when respond_to?(:to_nii_context)     then @nii = self
      when env = RackEnv[self, _nii_config] then @nii = env.context
      when respond_to?(:locale)             then @nii = Context.new(locale, _nii_config)
      when _nii_config.locale               then @nii = Context.new(_nii_config)
      when complain                         then raise Errors::SetupError, 'no nii context'
      else return
      end
      @nii.to_nii_context
    end

    # Check for a localization context (to avoid an exception when calling {#nii}).
    # Only necessary if you don't always set the context and it cannot be determined from the environment.
    # @return [true, false] Whether or not a localization context ist available
    def nii? = !!nii(false)

    # Sets the localization context. Argument may also be a locale.
    # @param value [Nii::Context, String, Symbol, Nii::Locale, Nii::LocalePreference, #to_nii_context, nil]
    def nii=(value)
      return @nii = nil unless value
      @nii = value.respond_to?(:to_nii_context) ? value : Context.new(value, _nii_config) 
    end

    def translate(message, variables = nil, **options)
      return nii.format(message, **options) unless message.is_a? Symbol or message.is_a? String
      default = options.fetch(:default, UNDEFINED)
      default = -> { super(message, **options) } if variables.nil? and defined? super
      nii.render(message, variables, **options, default: default)
    end
    alias_method :t, :translate

    def localize(object, **options)
      return super if defined? super and options[:format] and object.respond_to? :strftime
      nii.localize(object, **options)
    end
    alias_method :l, :localize

    private

    def _nii_config
      @_nii_config ||= begin
        config   = @nii_config   if defined? @nii_config
        config ||= nii_config    if respond_to? :nii_config
        config ||= to_nii_config if respond_to? :to_nii_config
        config &&= Config.new(config)
        config ||= Config.new
        config   = pre_config.merge(config) if pre_config = Config[self.class]
        config
      end
    end
  end
end
