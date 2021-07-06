# frozen_string_literal: true
require 'nii/all'
require 'money'

module Docs
  autoload :Document, 'docs/document'
  extend self

  def languages = @@languages

  @@languages = Nii::DATA.available_locales.inject({}) do |data, locale|
    alias_for        = Nii::DATA.resolve_alias(locale)
    alias_for        = nil               if alias_for == locale
    aka, locale      = locale, Nii::DATA.resolve_alias(alias_for) if alias_for
    locale           = Nii::Locale.parse(locale)
    language         = Nii::Locale.parse(locale.language)
    data[language] ||= { language: language, locales: { }, aliases: {}, variants: {} }

    if alias_for
      list = data[language][:aliases][locale] ||= []
      list << aka unless list.include? aka
    else
      list = data[language][:locales][Nii::DATA.source(locale).fetch('gem')] ||= []
      list << locale
    end
    
    data
  end

  registry = JSON.load_file File.expand_path('../../vendor/language-subtag-registry/data/json/registry.json', __dir__)
  registry.each do |data|
    next unless data['Type'] == 'variant' and data['Prefix']
    data['Prefix'].each do |locale|
      next unless locale = Nii::Locale.parse(locale) and @@languages.include? locale
      @@languages[locale][:variants][data['Subtag']] = { comments: data['Comments'].to_a, description: data['Description'].to_a }
    end
  end
end
