# frozen_string_literal: true

module Nii::Template
  class Concat < Element
    def resolve(context, variables, &block)
      result = payload.inject(String.new) { |output, value| output << value.render(context, variables, &block) }
      context.escape_html? ? Nii::HTMLString.new(result) : result
    end
  end
end
