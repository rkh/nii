# PAY NO ATTENTION TO THAT MAN BEHIND THE CURTAIN

template = <<-RUBY
# frozen_string_literal: true

# This file has been generated based on the Unicode Common Locale Data Repository.
# Do not edit directly.

# Shared namespace for all units. This can module can safely be included in Object or
# your own namespace, to avoid long class prefixes.
module Nii::Units
  # %{comment}
  class %{class} < GenericUnit
    self.quantity  %{space}=%{space_after} '%{quantity}'
    self.base_unit %{space}=%{space_after} '%{base_unit}'
    self.units     %{space}=%{space_after} %{units}
    self.aliases   %{space}=%{space_after} %{aliases}
    rules.divide   %{space}=%{space_after} %{divide}
    rules.multiply %{space}=%{space_after} %{multiply}

    %{methods}
  end
end
RUBY

method_template = <<-RUBY
    # Converts the object to %{unit_name}.
    # @return [%{class}] the equivalent instance in %{unit_name}
    def to_%{method_name}(**options) = convert_to('%{unit}', **options)

    # Whether or not amount is in %{unit_name}.
    # @return [true, false]
    def %{method_name}? = unit == '%{unit}'
RUBY

task :units do
  require 'json'
  require 'strscan'

  rules = [
    [ 'acceleration',            'duration',            'speed'                   ],
    [ 'angle',                   'angle',               'solid-angle'             ],
    [ 'concentration',           'volume',              'substance-amount'        ],
    [ 'current-density',         'area',                'electric-current'        ],
    [ 'current-density',         'length',              'magnetic-field-strength' ],
    [ 'electric-current',        'duration',            'electric-charge'         ],
    [ 'electric-current',        'electric-resistance', 'voltage'                 ],
    [ 'electric-resistance',     'duration',            'electric-inductance'     ],
    [ 'force',                   'length',              'energy'                  ],
    [ 'force',                   'speed',               'power'                   ],
    [ 'frequency',               'duration',            'angle'                   ],
    [ 'illuminance',             'area',                'luminous-intensity'      ],
    [ 'length',                  'area',                'volume'                  ],
    [ 'length',                  'length',              'area'                    ],
    [ 'magnetic-field-strength', 'length',              'electric-current'        ],
    [ 'mass-density',            'volume',              'mass'                    ],
    [ 'mass-fraction',           'mass',                'mass'                    ],
    [ 'power',                   'duration',            'energy'                  ],
    [ 'pressure-per-length',     'area',                'pressure'                ],
    [ 'resolution',              'length',              'graphics'                ],
    [ 'specific-volume',         'mass',                'volume'                  ],
    [ 'torque',                  'speed',               'power'                   ],
    [ 'wave-number',             'length',              'angle'                   ],
  ]

  specific_rules = {
    'consumption'  => { multiply: [ 'Length => Volume'      ] },
    'length'       => { multiply: [ 'Consumption => Volume' ] },
    'volume'       => { divide:   [ 'Consumption => Length' ] }
  }

  data = JSON.load_file('data/core/unit_data.json')
  en   = JSON.load_file('data/core/en/units.json').fetch('units')
  docs = String.new("\n")

  def self.parse(value, constants = {})
    return value unless value and value !~ /^\d+$/

    scanner = StringScanner.new(value)
    result  = String.new

    until scanner.eos?
      if part = scanner.scan(/\d+(\.\d+)?E[\-+]?\d+/)
        result << "'#{part}'.to_r"
      elsif part = scanner.scan(/\d+(\.\d+)?/)
        result << "#{part}r"
      elsif part = scanner.scan(/(?!E)[A-z]\w+/)
        result << (parse(constants[part], constants) || "CONSTANTS[:#{part}]")
      elsif part = scanner.scan(/[\*\-\/+\(\)]/)
        result << part
      elsif !scanner.scan(/ +/)
        raise "unexpected symbol: #{scanner.peek(1).inspect} in #{value.inspect}"
      end
    end

    result
  end

  def self.compute_unit(unit, units, quantity = nil)
    info = units[unit]
    return info if info

    case unit
    when /^pico([a-z]+)$/
      base_unit = units.fetch($1)
      info      = units[unit] = base_unit.merge('factor' => "#{base_unit['factor'] || 1}/1000000000000")
    when /^nano([a-z]+)$/
      base_unit = units.fetch($1)
      info      = units[unit] = base_unit.merge('factor' => "#{base_unit['factor'] || 1}/1000000000")
    when /^micro([a-z]+)$/
      base_unit = units.fetch($1)
      info      = units[unit] = base_unit.merge('factor' => "#{base_unit['factor'] || 1}/1000000")
    when /^milli([a-z]+)$/
      base_unit = units.fetch($1)
      info      = units[unit] = base_unit.merge('factor' => "#{base_unit['factor'] || 1}/1000")
    when /^centi([a-z]+)$/
      base_unit = units.fetch($1)
      info      = units[unit] = base_unit.merge('factor' => "#{base_unit['factor'] || 1}/100")
    when /^deci([a-z]+)$/
      base_unit = units.fetch($1)
      info      = units[unit] = base_unit.merge('factor' => "#{base_unit['factor'] || 1}/10")
    when /^hecto([a-z]+)$/
      base_unit = units.fetch($1)
      info      = units[unit] = base_unit.merge('factor' => base_unit['factor'] ? "#{base_unit['factor']}*100" : '100')
    when /^kilo([a-z]+)$/
      base_unit = units.fetch($1)
      info      = units[unit] = base_unit.merge('factor' => base_unit['factor'] ? "#{base_unit['factor']}*1000" : '1000')
    when /^mega([a-z]+)$/
      base_unit = units.fetch($1)
      info      = units[unit] = base_unit.merge('factor' => base_unit['factor'] ? "#{base_unit['factor']}*1000000" : '1000000')
    when /^giga([a-z]+)$/
      base_unit = units.fetch($1)
      info      = units[unit] = base_unit.merge('factor' => base_unit['factor'] ? "#{base_unit['factor']}*1000000000" : '1000000000')
    when /^tera([a-z]+)$/
      base_unit = units.fetch($1)
      info      = units[unit] = base_unit.merge('factor' => base_unit['factor'] ? "#{base_unit['factor']}*1000000000000" : '1000000000000')
    when /^peta([a-z]+)$/
      base_unit = units.fetch($1)
      info      = units[unit] = base_unit.merge('factor' => base_unit['factor'] ? "#{base_unit['factor']}*1000000000000000" : '1000000000000000')
    when /^square-([a-z]+)$/
      base_name = $1
      base_unit = compute_unit(base_name, units)
      raise "expected #{base_name} to be a length based on meter" unless base_unit['quantity'] == 'length' and base_unit['base_unit'] == 'meter'
      factor = base_unit.fetch('factor')
      info   = units[unit] = base_unit.merge('base_unit' => 'square-meter', 'quantity' => 'area', 'factor' => "#{factor}*#{factor}")
    when /^cubic-([a-z]+)$/
      base_name = $1
      base_unit = compute_unit(base_name, units)
      raise "expected #{base_name} to be a length based on meter" unless base_unit['quantity'] == 'length' and base_unit['base_unit'] == 'meter'
      factor = base_unit.fetch('factor')
      info   = units[unit] = base_unit.merge('base_unit' => 'cubic-meter', 'quantity' => 'volume', 'factor' => "#{factor}*#{factor}*#{factor}")
    when /^(.+)-per-(.+)$/
      a, b = $1, $2
      raise "could not resolve #{a}" unless first  = compute_unit(a, units)
      raise "could not resolve #{b}" unless second = compute_unit(b, units)

      if quantity
        raise 'cannot handle offsets' if first['offset'] or second['offset']
        quantity = 'resolution' if quantity == 'graphics'
        info = { 'quantity' => quantity, 'factor' => "(#{second['factor'] || 1})/(#{first['factor'] || 1})" }
        info['systems'] = first['systems']  if first['systems']
        info['systems'] = second['systems'] if second['systems']
        info['invert']  = true              if unit =~ /^mile-per-gallon/
        units[unit] = info
      end
    when 'kilowatt-hour'
      info = units[unit] = { 'factor' => '3600000', 'quantity' => quantity }
    when 'inch-ofhg'
      info = units[unit] = { 'factor' => '1500/5079583', 'quantity' => quantity }
    when 'millimeter-ofhg'
      info = units[unit] = { 'factor' => '500/66661', 'quantity' => quantity }
    when 'newton-meter'
      info = units[unit] = { 'factor' => '1', 'quantity' => quantity }
    when 'pound-force-foot'
      info = units[unit] = { 'factor' => '1.355818', 'quantity' => quantity }
    when /^([^\-]+)-([^\-]+)$/
      a, b = $1, $2
      raise "could not resolve #{a}" unless first  = compute_unit(a, units)
      raise "could not resolve #{b}" unless second = compute_unit(b, units)

      if quantity
        raise 'cannot handle offsets' if first['offset'] or second['offset']
        info = { 'quantity' => quantity, 'factor' => "(#{second['factor'] || 1})/(#{first['factor'] || 1})" }
        info['systems'] = first['systems']  if first['systems']
        info['systems'] = second['systems'] if second['systems']
        units[unit] = info
      end
    end

    info
  end

  all_units = data['units']

  en.each do |unit, en_data|
    info = compute_unit(unit, all_units, en_data['quantity'])
    puts "missing unit: #{unit} (#{en_data['quantity']})" unless info or unit == 'generic'
  end

  docs << " Quantity / Class        | Base Unit                                        | Supported Units\n" \
       << "-------------------------|--------------------------------------------------|-------------------------\n"

  data['base_units'].each do |type, base_unit|
    comment    = []
    units      = {}
    aliases    = {}
    divide     = specific_rules.dig(type, :divide)   || []
    multiply   = specific_rules.dig(type, :multiply) || []
    class_name = type.split('-').map(&:capitalize).join
    methods    = []

    if type == 'portion'
      data['base_units'].each_key do |other|
        other_class = other.split('-').map(&:capitalize).join
        multiply << "\n      #{other_class.ljust(21)} => #{other_class}"
      end
    else
      multiply << "Portion => #{class_name}"
    end

    divide << "Portion => #{class_name}"

    comment << "Instances of this class represent #{type.tr('-', ' ')} values." << '' << 'Supported Units:'
    docs << " `#{class_name}` ".ljust(25) << '| ' << " `#{base_unit}` ".ljust(50)  << '| '

    all_units.each do |unit, info|
      next unless info.fetch('quantity') == type

      comment_line = "* +#{unit}+"
      notes = []
      notes << 'base unit' if unit == base_unit
      # notes << info['systems'].map { |s| s.gsub(/^(us|uk)system$/) { $1.upcase } }.join('/') if info['systems']
      comment_line += " (#{notes.join(', ')})" if notes.any?
      comment << comment_line

      if unit != base_unit
        docs << "," unless docs.end_with? '| '
        docs << " `#{unit}`"
      end

      info['base_unit'] ||= base_unit
      raise "unexpected base for #{unit}: #{info['base_unit']}, expected #{base_unit}" if info['base_unit'] != base_unit
      info['factor'] ||= '1'
      info = info.map do |key, value|
        case key
        when 'base_unit', 'quantity' then nil
        when 'factor', 'offset'      then "#{key}: #{parse(value)}"
        when 'systems', 'invert'     then "#{key}: #{value.inspect}"
        else raise "unexpected key: #{key}"
        end
      end

      unit_pattern          = en.dig(unit, 'short', 'unit_pattern', 'other')
      if unit_pattern       =~ /^\{0\} ?(\S+)$/
        alias_unit          = $1
        aliases[alias_unit] = unit
        info << "symbol: '#$1'"
      end

      alias_unit &&= alias_unit.tr('²', '2').tr('³', '3').tr('⋅', '_').sub(/^°(.)/, 'deg_\1')
      alias_unit   = 'kph'  if alias_unit == 'km/h'
      alias_unit   = 'mps'  if alias_unit == 'm/s'
      alias_unit   = 'mps2' if alias_unit == 'm/s2'
      alias_unit   = nil    if %w[a c d f h i r s bn int enum str set proc hash ary json yaml].include? alias_unit
      alias_unit   = nil    if alias_unit.to_s.size > 20
      alias_unit   = nil    if alias_unit == unit
      alias_unit   = nil    if alias_unit !~ /^[A-z]\w*$/

      if unit.size > 20
        method_name = alias_unit
        alias_unit  = nil
      else
        method_name = unit.tr('-', '_')
      end
  
      if method_name and method_name !~ /^\d/
        unit_name = en.dig(unit, 'long', 'display_name') || unit
        methods << method_template % { unit: unit, class: class_name, method_name: method_name, unit_name: unit_name }
        methods << "alias_method :to_#{alias_unit}, :to_#{method_name}\n    alias_method :#{alias_unit}?, :#{method_name}?" if alias_unit
      end

      units[unit] = info.compact.join(', ')
    end

    unless units.include? type
      methods << <<-RUBY.gsub(/^    /, '')
        # @return [#{class_name}] self
        def to_#{type.tr('-', '_')} = self
      RUBY
    end

    if units.size == 1
      raise "unexpected unit" if units.keys != [base_unit]
      key_length  = 12
      units       = "{ base_unit => { #{units.values.first} }}"
      space_after = ''
    else
      value_length = units.values.map(&:size).max
      value_length = 0 if value_length > 50
      key_length   = units.keys.map { |k| k == base_unit ? 9 : k.size + 2 }.max
      key_length   = 12 if key_length < 12
      units        = units.map { |k, v| "      #{(k == base_unit ? 'base_unit' : "'#{k}'").ljust(key_length)} => { #{v.ljust(value_length)} }"}
      units        = "{\n#{units.sort.join(",\n")}}"
      space_after  = ' '
    end

    case aliases.size
    when 0 then aliases = "{}"
    when 1 then aliases = "{ '#{aliases.keys.first}' => '#{aliases.values.first}' }"
    else
      aliases = aliases.map { |k, v| "      #{"'#{k}'".ljust(key_length)} => '#{v}'" }
      aliases = "{\n#{aliases.sort.join(",\n")}}"
    end

    rules.each do |a, b, c|
      if a == type
        multiply << "#{b.split('-').map(&:capitalize).join} => #{c.split('-').map(&:capitalize).join}"
      elsif b == type
        multiply << "#{a.split('-').map(&:capitalize).join} => #{c.split('-').map(&:capitalize).join}"
      elsif c == type
        divide << "#{a.split('-').map(&:capitalize).join} => #{b.split('-').map(&:capitalize).join}"
        divide << "#{b.split('-').map(&:capitalize).join} => #{a.split('-').map(&:capitalize).join}" if a != b
      end
    end

    docs << "\n"

    File.write("nii-units/lib/nii/units/#{type.tr('-', '_')}.rb", template % {
      class:       class_name,
      base_unit:   base_unit,
      units:       units,
      space:       key_length.between?(13, 20) ? ' '*(key_length-12) : '',
      comment:     comment.join("\n  # "),
      quantity:    type,
      space_after: space_after,
      multiply:    "{ #{multiply.join(", ")} }",
      divide:      "{ #{divide.join(", ")} }",
      aliases:     aliases,
      methods:     methods.map(&:strip).join("\n\n    ")
    })
  end

  constants = data['constants']
  constants = constants.map do |key, value|
    value = parse(value, constants)
    value = 'Math::PI.to_r' if key == 'PI'
    "      #{key}:#{' '*(13-key.size)} #{value}"
  end.sort

  constants =  "CONSTANTS = {\n#{constants.join(",\n")}\n    }"

  File.write('nii-units/README.md', File.read('nii-units/README.md').
    sub(/<!-- start generated -->.+<!-- end generated -->/m, "<!-- start generated -->#{docs}<!-- end generated -->"))

  File.write('nii-units/lib/nii/units/generic_unit.rb',
    File.read('nii-units/lib/nii/units/generic_unit.rb').sub(/CONSTANTS = \{[^\}]+\}/m, constants))
end
