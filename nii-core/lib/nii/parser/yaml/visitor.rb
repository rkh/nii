# frozen_string_literal: true

module Nii::Parser::YAML
  class Visitor < Psych::Visitors::ToRuby
    def accept(target)
      # we avoid calling super here to skip the whole domain_tags logic
      result = Tagged.new deduplicate(visit(target))
      result.yaml_tag = target.tag unless result.frozen?
      @freeze ? result.freeze : result
    end
  end
end
