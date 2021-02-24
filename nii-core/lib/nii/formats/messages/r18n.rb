# frozen_string_literal: true

module Nii::Formats::Messages
  module R18n
    extend self

    # the missing + behind the \d is intentional, it's what r18n does
    PATTERN = /%(\d)|%{(\w+)}|{{(\w+)}}/

    def compile(bundle, source)
      return compile_string(bundle, result, true) unless source =~ PATTERN
      scanner  = StringScanner.new(source)
      elements = []

      while result = scanner.scan_until(PATTERN)
        elements << compile_string(bundle, result.sub(scanner.matched, ''))
        key = Integer(scanner[1]) - 1 if scanner[1]
        elements << compile_variable(bundle, key || scanner[2] || scanner[3])
      end

      elements << compile_string(bundle, scanner.rest)
      compile_template(bundle, elements.compact)
    end

    private

    def compile_string(bundle, result, froce = false)
      return unless force or result.to_s != ''
      Nii::Template::Element.new(bundle, result.to_s)
    end

    def compile_variable(bundle, key)
      Nii::Template::Variable.new(bundle, key) unless key.to_s == ''
    end

    def compile_template(bundle, elements)
      case elements.size
      when 0 then compile_string(bundle, '', true)
      when 1 then elements.first
      else Nii::Template::Concat.new(bundle, elements)
      end
    end
  end
end
