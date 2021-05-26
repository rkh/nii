# frozen_string_literal: true

module Nii::CLI
  class Command < Dry::CLI::Command
    include Nii::Helpers
    extend  Nii::Helpers

    def self.register(command, ...)
      self.nii = Nii::Context.new(NII_LOCALE, NII_CONFIG, namespace: command.tr(' ', '/'))
      Nii::CLI.register(command, self, ...)

      desc    t(:description)        if nii.has_message? :description
      example t(:example).split(?\n) if nii.has_message? :example
    end

    def self.argument(name, **options)
      options[:desc]   = t(options[:desc]) if options[:desc].is_a? Symbol
      options[:desc] ||= t(name)           if nii.has_message? name
      super
    end

    def self.option(name, **options)
      options[:desc]   = t(options[:desc]) if options[:desc].is_a? Symbol
      options[:desc] ||= t(name)           if nii.has_message? name
      super
    end

    def nii = self.class.nii

    def error(message, status: 1, **variables)
      $stderr.puts t(:error, { message: t(message, variables, default: message) })
      exit status
    end
  end
end
