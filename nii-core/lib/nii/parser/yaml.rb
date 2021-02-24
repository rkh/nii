# frozen_string_literal: true
require 'psych'

module Nii::Parser
  module YAML
    class Visitor < Psych::Visitors::ToRuby
      def initialize(*args, domain_types: {}, **options)
        super(*args, **options)
        @domain_types = prepare_domain_types(domain_types)
      end

      private

      def prepare_domain_types(tags)
        return {} if tags.empty? or tags.nil?
        full_tags    = {}
        domain_types = {}
        builder      = -> (tag, result) { tags.fetch(tag).new(result) }

        tags.inject({}) do |types, (tag, value)|
          value = builder unless value.respond_to? :call
          types.merge! "tag:yaml.org,2002:#{tag}" => [tag, value], "tag:#{tag}" => [tag, value]
        end
      end
    end

    extend self

    def parse(source, tags: {}, file_name: nil, permitted_classes: [], permitted_symbols: [])
      class_loader = Psych::ClassLoader::Restricted.new(permitted_classes.map(&:to_s), permitted_symbols.map(&:to_s))
      scanner      = Psych::ScalarScanner.new(class_loader)
      visitor      = Visitor.new(class_loader, scanner, domain_types: domain_types(tags))
      document     = Psych.parse(source, filename: file_name)
      visitor.accept(document)
    end
  end
end
