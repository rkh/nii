# frozen_string_literal: true

module Nii::Info
  # This will be exposed as {Nii::Context#numbers}.
  # @see Nii::Context#method_missing
  class Numbers < Generic
    OVERRIDE_SYSTEMS = [nil, 'default', 'native', 'traditional', 'finance']
    SYSTEM_MAP       = {
      'default'      => { 'finance' => 'default' },
      'native'       => { 'default' => 'native', 'finance' => 'native' },
      'traditional'  => { 'default' => 'traditional' }
    }
    private_constant :OVERRIDE_SYSTEMS, :SYSTEM_MAP

    def initialize(context)
      @systems = {}
      super
    end

    def symbols(system = nil)
      get(system, :symbols)
    end

    def format_rules(type, format = :standard, system: nil)
      get(system, "#{type}_formats", format)
    end

    # def misc_patterns(*keys, system: nil)
    #   get(system, :misc_patterns, *keys)
    # end

    # @param key [Symbol, String, nil]
    #   Indicates which numbering system to use.
    #   Should either be a known identifier (+latn+, +arab+, etc) or one of the
    #   special identifiers +default+, +finance+, +native+, or +traditional+.
    #
    # @return [Nii::NumberingSystem::Generic]
    def system(key = nil)
      return key.to_nii_number_system if key.respond_to? :to_nii_number_system
      key = Nii::Utils.string(key || 'default')

      if map = SYSTEM_MAP[config.numbering_system || 'default']
        key  = map[key] || key
      elsif OVERRIDE_SYSTEMS.include? key
        key  = config.numbering_system if config.numbering_system?
      end

      key = locale.numbering_system || key if OVERRIDE_SYSTEMS.include? key
      key = locale_info(:numbers, :other_numbering_systems, key) || key
      key = 'default' unless key and data.numbering_system_known? key

      @systems[key] ||= begin
        default = locale_info(:numbers, :default_numbering_system)
        key     = default.fetch(key, key) if default.is_a? Hash
        key     = default if key == 'default'
        data.numbering_system(key)
      end
    end

    def currency(code = nil)
      return code.to_nii_currency if code.respond_to? :to_nii_currency
      code ? Nii::Currency[code] : context.currency
    end

    private

    def get(system, key, *keys)
      keys.compact!
      result = locale_info(:numbers, key, system(system).code)
      result = result.dig(*keys.map(&:to_s)) if keys.any? and result
      result
    end
  end
end
