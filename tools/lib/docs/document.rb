# frozen_string_literal: true

module Docs
  class Document
    include Docs, Nii::Helpers

    class Language < Document
      def partial(key, complain: true)
        super("#{language}/#{key}", complain: false) || super(key, complain: complain)
      end

      def spellout_examples
        @spellout_examples ||= begin
          nii   = Nii::Context.new(language)
          base  = [1, 115]
          year  = 2020  
          lines = base.map { ["nii.numbers.spellout #{_1}", nii.numbers.spellout(_1)] }

          if year_spelled = nii.numbers.spellout(year) and year_spelled != nii.numbers.spellout(year, :year)
            lines << ["nii.numbers.spellout #{year}", year_spelled]
          end

          nii.numbers.spellout_rules.rule_sets.each do |set|
            case set
            when 'spellout-numbering'      then next
            when 'spellout-numbering-year' then keys, values = [:year], [year]
            else
              keys   = set.split('-').map(&:to_sym) - [:spellout, :numbering, :cardinal]
              values = base
            end
            values.each do |value|
              result = nii.numbers.spellout(value, *keys)
              if keys == [:year] or result != nii.numbers.spellout(value)
                lines << [
                  "nii.numbers.spellout #{"#{value},".ljust(5)} #{keys.map(&:inspect).join(', ')}",
                  nii.numbers.spellout(value, *keys)
                ]
              end
            end
          end

          lines.reject! { _1[1] =~ /^[\d\,]+\.?$/ }
          lines.uniq!
          length = lines.map { _1[0].length }.max
          lines.map { "#{_1.ljust(length)} # => #{_2.inspect}" }
        end
      end
    end

    def initialize(path, data = {})
      @nii       = Nii::Context.new 'en'
      @path      = path
      @directory = @path.dirname
      @file_name = @path.relative_path.to_s
      @data      = data.transform_keys(&:to_sym)
    end

    def partial(key, complain: true)
      path = Pathname.new(key.to_s)
      path = @path.dirname + path.dirname + "_#{path.basename}.md.erb"
      render(path) if complain or path.exist?
    end

    def partial? = @path.basename.to_s.start_with?(?_)

    def write(target)
      target.dirname.mkpath unless target.dirname.exist?
      target.write("<!-- This file has been generated. Source: #{@file_name} -->\n\n#{render(@path)}")
    end

    def render(path)
      path              = Pathname.new(path) unless path.is_a? Pathname
      template          = ERB.new path.read, nil, '-'
      template.filename = path.to_s
      template.result(binding)
    end

    def method_missing(key, *args, **options)
      return super if args.any? or options.any?
      return super unless @data.include? key.to_sym

      if result = @data[key.to_sym]
        block_given? ? yield(result) : result
      else
        result
      end
    end
  end
end
