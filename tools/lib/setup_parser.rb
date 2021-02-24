# frozen_string_literal: true
require 'yaml'

class SetupParser
  def initialize
    @methods = {}
    @scopes  = {}
  end

  def resolve(name)
    case object = YARD::Registry.resolve(nil, name)
    when YARD::CodeObjects::ClassObject
      # no idea what the proper way would be to have yard resolve the reference
      if object.superclass.is_a? YARD::CodeObjects::Proxy and superclass = resolve(object.superclass)
        object.superclass = superclass
      end
      object.instance_mixins.map! do |mixin|
        next mixin unless mixin.is_a? YARD::CodeObjects::Proxy
        resolve(mixin) || mixin
      end
    end
    object
  end

  def load(name, scope:, gem:)
    raise "could not resolve #{name}" unless object = resolve(name)

    @data   = nil
    aliases = {}

    @scopes[scope.to_s] = { 'documentation' => object.docstring.to_s, 'gem' => gem } if scope != :everywhere
    object.meths(visibility: :public, scope: :instance).each do |method|
      if method.is_alias?
        aliases[method.name.to_s] = method.namespace.aliases[method]
      else
        next if method.tag('api')&.text != 'setup'
        info = @methods[method.name] ||= {
          name:          method.name.to_s,
          aliases:       [],
          default:       method.tag('default')&.text,
          documentation: method.docstring.to_s,
          example:       method.tag('example')&.text,
          scopes:        [],
          summary:       method.docstring.summary,
        }
        scope &&= scope.to_s
        info[:scopes] << scope if scope and not info[:scopes].include? :scope
      end
    end

    aliases.each do |name, alias_for|
      next unless info = @methods[alias_for]
      info[:aliases] << name unless info[:aliases].include? name
    end
  end

  def data
    @data ||= begin
      methods = []
      scopes  = []
      @methods.each_value do |info|
        info = info.transform_keys(&:to_s).compact
        methods << info
        info['aliases'].each do |name|
          methods << info.merge({
            'name'          => name,
            'alias_for'     => info['name'],
            'aliases'       => [info['name']] + info['aliases'] - [name],
            'documentation' => "Alias for #{info['name']}.",
            'summary'       => "Alias for #{info['name']}.",
            'example'       => nil,
          }).compact
        end
      end
      { 'scopes' => @scopes, 'methods' => methods.sort_by { |i| i['name'] }}
    end
  end

  def to_yaml
    data.to_yaml.sub(/\A---\n/, "\\0# This file is generated from source code comments.\n")
  end

  def to_markdown
    sections = String.new
    table    = String.new
    widths   = [45, 70, 40]

    table << " Option ".ljust(widths[0]) << " | Summary\n" # << " | Scope ".ljust(widths[1]+3) << " | Summary\n"
    table << "-"*(widths[0]+1) << "|"  << "-"*widths[2] << "\n"  # << "-"*(widths[1]+2) << "|" << "-"*widths[2] << "\n"

    data['methods'].each do |method|
      scopes = method['scopes'].map { |s| s.capitalize }.join(', ')
      table << " [`#{method['name']}`](##{method['name']})".ljust(widths[0]) << " | " << method['summary'] << "\n"
      # table << scopes.ljust(widths[1]) << " | " << method['summary'] << "\n"
      sections << "\n### `#{method['name']}`\n**Scope: #{scopes}**\n"
      if alias_for = method['alias_for']
        sections << "\nAlias for [`#{alias_for}`](##{alias_for}).\n"
      else
        sections << "\n#{method['documentation']}\n"
        sections << "\n``` ruby\n#{method['example']}\n```\n" if method['example']
      end
    end

    scopes = [
      " Scope          | Gem            | Description ",
      "----------------|----------------|--------------------------------",
      *@scopes.map { |key, info| " #{key.capitalize.ljust(14)} | #{info['gem'].ljust(14)} | #{info['documentation']}" }
    ].join("\n")

    "<!-- This file is generated from source code comments. -->\n\n# Setup Options\n" \
    "\n## Overview\n\n#{table}\n\n## Scopes\n\n#{scopes}\n\n## Details\n#{sections}" \
  end
end
