# frozen_string_literal: true

module Nii::Formatters
  module Array
    LIST_STYLE_ALIASES = {
      'and'        => 'standard',
      'and-narrow' => 'standard-narrow',
      'and-short'  => 'standard-short',
      'narrow'     => 'standard-narrow',
      'short'      => 'standard-short',
    }
    private_constant :LIST_STYLE_ALIASES

    extend self

    # @see Nii::Context#format
    #
    # @example Simple List
    #   context = Nii::Context.new("en")
    #   context.format ["a", "b", "c"] # => "a, b, and c"
    #
    # @example Format options
    #   context = Nii::Context.new("en")
    #   context.format %w[FR DE], as: :country # => "France and Germany"
    #   context.format [1, 2], list_style: :or # => "1 or 2"
    #
    # @example Passing a block for element formatting
    #   context = Nii::Context.new("en")
    #   context.format user.posts do |post|
    #     context.html "<a href='?'>?</a>", post.link, post.title
    #   end
    #
    # @param context [Nii::Context]
    #   Localization context to use for formatting.
    #
    # @param value [::String, Nii::HTMLString, ActiveSupport::SafeBuffer]
    #   String to format.
    #
    # @option options [String, Symbol] list_style (standard)
    #   Style for the list to use.
    #   Available styles:
    #   * +standard+/+and+ (default): A typical 'and' list for arbitrary placeholders.
    #   * +standard-short+/+and-short+: A short version of an 'and' list, suitable for use with short or abbreviated placeholder values.
    #   * +standard-narrow+/+and-narrow+: A yet shorter version of a short 'and' list (where possible).
    #   * +or+: A typical 'or' list for arbitrary placeholders.
    #   * +or-short+: A short version of an 'or' list.
    #   * +or-narrow+: A yet shorter version of a short 'or' list (where possible).
    #   * +unit+: A list suitable for wide units (3 feet, 7 inches).
    #   * +unit-short+: A list suitable for short units (3 ft, 7 in).
    #   * +unit-narrow+: A list suitable for narrow units, where space on the screen is very limited (3′ 7″).
    #
    # @!scope module
    def format(context, value, **options)
      list    = Array(value).map do |entry|
        entry = yield(entry) if block_given?
        context.format(entry, **options) if entry
      end
      
      list_style   = options[:list_style]
      list_style &&= LIST_STYLE_ALIASES[::Nii::Utils.string(list_style)] || list_style
      list_style ||= 'standard'
      list.compact!

      case list.size
      when 0 then ''
      when 1 then list.first
      when 2 then insert(context, list_style, '2', *list, options)
      else
        result = insert(context, list_style, 'end', *list.pop(2), options)
        result = insert(context, list_style, 'middle', list.pop, result, options) while list.size > 1
        insert(context, list_style, 'start', list.first, result, options)
      end
    end

    private

    def insert(context, style, element, first, second, options)
      pattern = context.text.list_pattern(style, element, first, second)
      context.html(pattern, first, second, **options)
    end
  end
end
