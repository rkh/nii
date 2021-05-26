# frozen_string_literal: true

module Nii::Template
  class Concat < Element
    def deconstruct = payload

    def resolve(context, variables, &block)
      result = payload.inject(String.new) { |output, value| output << value.render(context, variables, &block) }
      context.escape_html? ? context.html.safe(result) : result
    end

    private

    def each_child(&block) = payload.each(&block)
  end
end
