# frozen_string_literal: true

module Nii::Info
  # This will be exposed as {Nii::Context#text}.
  # @see Nii::Context#method_missing
  class Text < Generic
    BIDI = {
      html: {
        isolate:  [ '<bdi dir="?">', '</bdi>' ],
        embed:    [ '<bdi dir="?">', '</bdi>' ],
        override: [ '<bdo dir="?">', '</bdo>' ]
      },
      utf: {
        isolate:  [ { ltr: "\u2066", rtl: "\u2067", auto: "\u2068" }, "\u2069" ],
        embed:    [ { ltr: "\u202A", rtl: "\u202B" }, "\u202C" ],
        override: [ { ltr: "\u202D", rtl: "\u202E" }, "\u202C" ]
      }
    }
    private_constant :BIDI

    # Language/Script dependent character order.
    #
    # @note
    #   This parameter gives the most common way for ordering characters for digital content.
    #   It is not sufficient to determine whether text may also be written in a different
    #   direction, as is the case in some Asian languages.
    #
    # @return [String]
    #   Either +left-to-right+ or +right-to-left+.
    #   In theory also +top-to-bottom+ or +bottom-to-top+, but these do not occur in the dataset.
    def character_order = locale_info(:layout, :orientation, :character_order)

    # Language/Script dependent line order.
    #
    # @note   
    #   This parameter gives the most common way for ordering lines for digital content.
    #   It is not sufficient to determine whether text may also be written in a different
    #   direction, as is the case in some Asian languages.
    #
    # @return [String]
    #   Always +top-to-bottom+.
    #   In theory also +bottom-to-top+, +left-to-right+, or +right-to-left+, but these do not occur in the dataset.
    def line_order = locale_info(:layout, :orientation, :line_order)

    # @return [true, false] Whether charater order is left to right.
    def left_to_right? = character_order == 'left-to-right'
    alias_method :ltr?, :left_to_right?

    # @return [true, false] Whether charater order is right to left.
    def rigth_to_left? = character_order == 'right-to-left'
    alias_method :rtl?, :rigth_to_left?

    # @api internal
    def list_pattern(style, element, first = nil, second = nil)
      result = locale_info(:list_patterns, style, element)
      raise ArgumentError, "unsupported list style: #{style.inspect}" unless result
      result
    end

    # @api internal
    def key_type_pattern = locale_data(:names, :display_pattern, :key_type_pattern)

    # @return [Symbol, String, nil] mode parameter to use instead of +nil+ for {#bidi}
    # @see #bidi
    attr_accessor :bidi_mode

    # @!attribute bidi_options
    # @return [Hash, nil] default options for {#bidi}
    # @see #bidi
    def bidi_options = @bidi_options ||= {}
    attr_writer :bidi_options

    # @param mode [Symbol, String, nil, true, false]
    #   Determines whether and how to add BiDi control instructions:
    #   * +nil+ - Let Nii determine whether to add BiDi instructions.
    #   * +false+ – Never add BiDi instructions.
    #   * +true+ - Always add BiDi instructions.
    #   * +html+ – Same as +true+, but also sets the +format+ option to +html+.
    #   * +ltr+ – Same as +true+, but also sets the +direction+ option to +ltr+.
    #   * +rtl+ – Same as +true+, but also sets the +direction+ option to +rtl+.
    #
    # @option options [Symbol, String] format (:utf)
    #   Format to use for BiDi instructions:
    #   * +utf+: Add UTF instruction sequences.
    #   * +html+: Add HTML tags.
    #
    # @option options [Symbol, String] instruction (:isolate)
    #   BiDi embed mode:
    #   * +isolate+: Isolate the embedded content from the surrounding text. Only mode that supports
    #     automatic direction detection.
    #   * +embed+: Allows the embedded text to interact with the surrounding content. May result in
    #     more natural formatting, but risks the effect spilling over to the outer content.
    #     Will not do anything if direction is set to "auto".
    #   * +override+: Overrides the Unicode algorith with a fixed direction.
    #     If +direction+ is set to +auto+, it will instead be based on {#character_order}.
    #     This means you need to be certain that the content is in that order or explicitely set the direction.
    #
    # @return String
    #
    # @raise [Encoding::UndefinedConversionError]
    #   If mode is set to +utf+ (default) and {Nii::Context#encoding} is not UTF BiDi compatible.
    #
    # @raise [ArgumentError]
    #   If an unsupported value is passed as mode or for one of the options.
    def bidi(string, mode = true, **options)
      options = bidi_options.merge(options)

      case mode ||= bidi_mode
      
      when nil
        return string unless Nii::Utils.is_unicode?(context.encoding) or options[:format]&.downcase&.to_sym == :html
        return string unless locales = config.available_locales
        order     = self.character_order
        auto_bidi = config.data.cache(:auto_bidi, locales: locales) do
          locales.any? { |l| config.data.locale_data(l, :info, :orientation, :character_order) != order }
        end
        bidi(string, auto_bidi, **options)
      
      when :html, 'html'
        bidi(string, true, **options.merge(format: :html))
      
      when :utf, 'utf'
        bidi(string, true, **options.merge(format: :utf))
      
      when true
        format      = options[:format]&.downcase&.to_sym || :utf
        direction   = options[:direction]&.to_sym        || :auto
        instruction = options[:instruction]&.to_sym      || :isolate
        direction   = character_order.to_sym if instruction == :override and direction == :auto
        return string if instruction == :embed and direction == :auto

        direction = :ltr if direction == :'left-to-right' # so that {#character_order} may be passed as an option
        direction = :rtl if direction == :'right-to-left' # same as above
        
        open, close = BIDI
          .fetch(format)      { raise ArgumentError, "Unsupported format: #{format.inspect}" }
          .fetch(instruction) { raise ArgumentError, "Unsupported instruction: #{instruction.inspect}" }
       
        if format == :html
          context.html("#{open}?#{close}", direction, string)
        else
          "#{open.fetch(direction)}#{string}#{close}".encode(context.encoding)
        end
      
      when false
        string
      
      else
        raise ArgumentError, "Unsupported BiDi mode: #{mode.inspect}"
      end
    end
  end
end
