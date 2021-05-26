# frozen_string_literal: true

module Nii::CLI
  class Convert < Command
    FORMATS       = Nii::Formats.available.map { [Nii::Utils.type(_1), _1] }.to_h
    FORMAT_OPTION = {}
    ALIASES       = { yaml: ['-y'], json: ['-j'] }

    register 'convert'
    argument :input_file
    argument :output_file

    option :input_format,  aliases: ['-i'], values: FORMATS.keys
    option :output_format, aliases: ['-o'], values: %w[i18n fluent]
    option :locale,        aliases: ['-l'], default: 'mul'

    FORMATS.each do |key, format|
      next unless format <= Nii::Formats::JSON and formats = format::FORMATS
      next unless formats.is_a? Hash and formats.size > 1

      formats = ['detect'] + formats.keys.map { Nii::Utils.string(_1) }
      option key, values: formats, desc: t(:format, { name: format.name[/[^:]+$/] }), aliases: ALIASES[key], default: 'detect'

      FORMAT_OPTION[format] = key
    end

    def call(locale: nil, input_file: nil, input_format: nil, output_file: nil, output_format: nil, **options)
      locale = Nii::Locale.parse(locale)
      bundle = Nii::Bundle.new(locale, nil)
      
      if input_file
        input_format ||= File.extname(input_file).sub(/^\./, '')
        content = File.read(input_file)
      else
        error :no_input_format unless input_format
        $stderr.puts t(:no_input)
        content = $stdin.read
      end

      format = FORMATS[input_format.to_sym] || Nii::Formats.extensions[input_format.to_s]
      error :unknown_format, format: input_format unless format

      if key = FORMAT_OPTION[format] and option = options[key]
        config = { key => { format: option } }
      end

      format = format.new Nii::Config.new(config)
      format.compile(bundle, content)

      output_format ||= output_format(output_file)
      output = bundle.compile_to(output_format, **output_options(output_format, output_file))

      output_file ? File.write(output_file, output) : puts(output)
    end

    def output_format(path)
      return 'fluent' unless path
      case ext = File.extname(path)
      when '.yml', '.yaml', '.json', '.rb' then 'i18n'
      when '.ftl', '.fluent'               then 'fluent'
      else error(:unknown_format, format: ext)
      end
    end

    def output_options(format, path)
      ext = File.extname(path) if format == 'i18n' and path
      case ext
      when '.json'         then options = { as: :json }
      when '.yml', '.yaml' then options = { as: :yaml }
      when '.rb'           then options = { as: :ruby }
      else                      options = {}
      end

      options.merge!({
        rename_invalid: true
      })
    end
  end
end
